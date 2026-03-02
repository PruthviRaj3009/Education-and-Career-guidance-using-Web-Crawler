import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:careerguidance/config/api_keys.dart';

/// Service layer for OpenAI chat interactions
/// 
/// Handles all business logic related to chat operations including:
/// - API communication
/// - Error handling
/// - Request/response transformation
/// - Conversation history management
class ChatService {
  late final OpenAI _openAI;
  static const int _maxTokens = 1000;
  static const int _maxConversationLength = 20; // Keep last 20 messages for context

  ChatService() {
    _openAI = OpenAI.instance.build(
      token: ApiKeys.openAiApiKey,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 10),
      ),
      enableLog: false, // Disable in production
    );
  }

  /// Send a chat message and get response
  /// 
  /// [userMessage] - The user's message text
  /// [conversationHistory] - List of previous messages for context
  /// 
  /// Returns the AI response text or throws an exception
  Future<String> sendMessage({
    required String userMessage,
    required List<Map<String, String>> conversationHistory,
  }) async {
    try {
      // Validate input
      if (userMessage.trim().isEmpty) {
        throw ChatException('Message cannot be empty');
      }

      // Limit conversation history to prevent token overflow
      final limitedHistory = _limitConversationHistory(conversationHistory);

      // Add current message
      final messages = [
        ...limitedHistory,
        {'role': 'user', 'content': userMessage},
      ];

      // Convert to API format
      final apiMessages = messages.map((msg) {
        final role = msg['role'] == 'user' ? Role.user : Role.assistant;
        return Messages(role: role, content: msg['content'] ?? '').toJson();
      }).toList();

      // Create request
      final request = ChatCompleteText(
        messages: apiMessages,
        maxToken: _maxTokens,
        model: GptTurboChatModel(),
      );

      // Make API call
      final response = await _openAI.onChatCompletion(request: request);

      // Parse response
      final choices = response?.choices;
      if (choices == null || choices.isEmpty) {
        throw ChatException('No response received from API');
      }

      final content = choices.first.message?.content;
      if (content == null || content.isEmpty) {
        throw ChatException('Empty response received from API');
      }

      return content;
    } on ChatException {
      rethrow; // Pass our custom exceptions up
    } catch (e) {
      // Handle different error types
      if (e.toString().contains('timeout')) {
        throw ChatException('Request timeout. Please check your connection.');
      } else if (e.toString().contains('401') || e.toString().contains('Unauthorized')) {
        throw ChatException('Invalid API key. Please check your configuration.');
      } else if (e.toString().contains('429')) {
        throw ChatException('Rate limit exceeded. Please try again later.');
      } else if (e.toString().contains('SocketException') || 
                 e.toString().contains('NetworkException')) {
        throw ChatException('No internet connection. Please check your network.');
      } else {
        throw ChatException('Failed to get response: ${e.toString()}');
      }
    }
  }

  /// Limit conversation history to prevent token overflow
  List<Map<String, String>> _limitConversationHistory(
    List<Map<String, String>> history,
  ) {
    if (history.length <= _maxConversationLength) {
      return history;
    }
    
    // Keep only the most recent messages
    return history.sublist(history.length - _maxConversationLength);
  }

  /// Dispose resources
  void dispose() {
    // Clean up if needed
  }
}

/// Custom exception for chat-related errors
class ChatException implements Exception {
  final String message;
  
  ChatException(this.message);

  @override
  String toString() => message;
}
