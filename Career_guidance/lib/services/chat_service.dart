import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:careerguidance/config/api_keys.dart';

/// Service layer for Google Gemini chat interactions
/// 
/// Handles all business logic related to chat operations including:
/// - API communication
/// - Error handling
/// - Request/response transformation
/// - Conversation history management
class ChatService {
  late final GenerativeModel _model;
  static const int _maxConversationLength = 20; // Keep last 20 messages for context
  
  // Stable Gemini model for production
  static const String _modelName = 'gemini-2.5-flash';

  ChatService() {
    log('[ChatService] Initializing Gemini model: $_modelName');
    
    _model = GenerativeModel(
      model: _modelName,
      apiKey: ApiKeys.geminiApiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 2048,
      ),
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.medium),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.medium),
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.medium),
      ],
    );
    
    log('[ChatService] ✅ Gemini model initialized successfully');
  }

  /// Send a chat message and get response
  /// 
  /// [userMessage] - The user's message text
  /// [conversationHistory] - List of previous messages for context
  /// 
  /// Returns the AI response text or throws a ChatException
  Future<String> sendMessage({
    required String userMessage,
    required List<Map<String, String>> conversationHistory,
  }) async {
    log('[ChatService] sendMessage called');
    log('[ChatService] User message: "${userMessage.substring(0, userMessage.length > 50 ? 50 : userMessage.length)}..."');
    
    // Validate input
    if (userMessage.trim().isEmpty) {
      log('[ChatService] ❌ Empty message rejected');
      throw ChatException('Message cannot be empty');
    }

    try {
      // Limit conversation history to prevent token overflow
      final limitedHistory = _limitConversationHistory(conversationHistory);
      log('[ChatService] Conversation history limited to ${limitedHistory.length} messages');

      // Convert conversation history to Gemini format
      final history = limitedHistory.map((msg) {
        final role = msg['role'] == 'user' ? 'user' : 'model';
        return Content(role, [TextPart(msg['content'] ?? '')]);
      }).toList();
      
      log('[ChatService] Creating chat session...');

      // Create chat session with history
      final chat = _model.startChat(history: history);

      log('[ChatService] Sending message to Gemini API...');
      // Send message and get response
      final response = await chat.sendMessage(
        Content.text(userMessage.trim()),
      );
      
      log('[ChatService] ✅ Response received from Gemini API');

      // Parse response
      final text = response.text;
      if (text == null || text.isEmpty) {
        log('[ChatService] ❌ Empty response received');
        throw ChatException('Empty response received from API');
      }

      log('[ChatService] ✅ Response text length: ${text.length} characters');
      return text;
      
    } on GenerativeAIException catch (e) {
      log('[ChatService] ❌ GenerativeAIException: ${e.message}');
      
      // Handle Gemini-specific errors
      if (e.message.contains('not found') || 
          e.message.contains('not supported')) {
        log('[Error] Model not found: $_modelName');
        throw ChatException('AI model not found. Please check the model configuration.');
      } else if (e.message.contains('API key')) {
        log('[Error] Invalid API key');
        throw ChatException('Invalid API key. Please check your configuration.');
      } else if (e.message.contains('quota') || e.message.contains('429')) {
        log('[Error] Rate limit exceeded');
        throw ChatException('Rate limit exceeded. Please try again in a few moments.');
      } else if (e.message.contains('SAFETY')) {
        log('[Error] Safety filter triggered');
        throw ChatException('Your message was blocked by safety filters. Please rephrase and try again.');
      } else {
        log('[Error] Unknown Gemini error: ${e.message}');
        throw ChatException('AI service error: ${e.message}');
      }
    } on ChatException {
      rethrow; // Pass our custom exceptions up
    } catch (e) {
      log('[ChatService] ❌ Unexpected error: ${e.toString()}');
      
      // Handle other error types
      if (e.toString().contains('timeout')) {
        log('[Error] Request timeout');
        throw ChatException('Request timeout. Please check your connection and try again.');
      } else if (e.toString().contains('SocketException') || 
                 e.toString().contains('NetworkException')) {
        log('[Error] Network error');
        throw ChatException('No internet connection. Please check your network.');
      } else {
        log('[Error] Unexpected error: ${e.toString()}');
        throw ChatException('Unexpected error: ${e.toString()}');
      }
    }
  }

  /// Limit conversation history to prevent token overflow
  List<Map<String, String>> _limitConversationHistory(
    List<Map<String, String>> history,
  ) {
    if (history.length <= _maxConversationLength) {
      log('[ChatService] History within limit: ${history.length} messages');
      return history;
    }
    
    log('[ChatService] Limiting history from ${history.length} to $_maxConversationLength messages');
    // Keep only the most recent messages
    return history.sublist(history.length - _maxConversationLength);
  }

  /// Dispose resources
  void dispose() {
    log('[ChatService] Disposing chat service');
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
