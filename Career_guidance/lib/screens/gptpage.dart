import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:careerguidance/config/api_keys.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final GenerativeModel _geminiModel;

  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'User',
  );

  final ChatUser _geminiChatUser = ChatUser(
    id: '2',
    firstName: 'Gemini',
    lastName: 'AI',
  );

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  // Stable Gemini model for production
  static const String _modelName = 'gemini-2.5-flash';

  @override
  void initState() {
    super.initState();
    log('[ChatPage] Initializing Gemini model...', name: 'ChatPage');
    log('[ChatPage] API Key: ${ApiKeys.geminiApiKey.substring(0, 10)}...',
        name: 'ChatPage');

    _geminiModel = GenerativeModel(
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

    log('[ChatPage] ✅ Gemini model initialized successfully: $_modelName',
        name: 'ChatPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF1E2A38),
        elevation: 0,
        title: const Text(
          'Scope of growth',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
      body: DashChat(
        currentUser: _user,
        messageOptions: MessageOptions(
          currentUserContainerColor: const Color(0xFF2563EB),
          containerColor: Colors.white,
          textColor: const Color(0xFF1F2937),
          currentUserTextColor: Colors.white,
          borderRadius: 16,
          messagePadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
        ),
        inputOptions: InputOptions(
          inputDecoration: InputDecoration(
            hintText: 'Type your message...',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
          ),
          sendButtonBuilder: (VoidCallback send) {
            return Container(
              margin: const EdgeInsets.only(left: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2563EB),
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: send,
              ),
            );
          },
        ),
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _messages,
        typingUsers: _typingUsers,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    log('[ChatPage] User message received: "${m.text}"', name: 'ChatPage');

    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_geminiChatUser);
    });

    log('[ChatPage] Using model: $_modelName', name: 'ChatPage');

    try {
      log('[ChatPage] Sending message to Gemini API...', name: 'ChatPage');

      // Convert conversation history to Gemini format
      final history = _messages.reversed.toList().map((msg) {
        final role = msg.user == _user ? 'user' : 'model';
        return Content(role, [TextPart(msg.text)]);
      }).toList();

      log('[ChatPage] Conversation history length: ${history.length}',
          name: 'ChatPage');

      // Remove the last message (current user message) from history
      final chatHistory = history.sublist(0, history.length - 1);
      log('[ChatPage] Chat history for context: ${chatHistory.length} messages',
          name: 'ChatPage');

      // Create chat session with history
      log('[ChatPage] Creating chat session with model: $_modelName',
          name: 'ChatPage');
      final chat = _geminiModel.startChat(history: chatHistory);

      // Send the current message
      final response = await chat.sendMessage(
        Content.text(m.text),
      );

      log('[ChatPage] ✅ Response received from Gemini API', name: 'ChatPage');

      final text = response.text;
      log('[ChatPage] Response text length: ${text?.length ?? 0}',
          name: 'ChatPage');

      if (text == null || text.isEmpty) {
        log('[ChatPage] ⚠️ Empty response received from Gemini',
            name: 'ChatPage');
        _showError("Sorry, I couldn't generate a response. Please try again.");
        return;
      }

      log('[ChatPage] ✅ Successfully generated response', name: 'ChatPage');

      if (!mounted) return;
      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _geminiChatUser,
            createdAt: DateTime.now(),
            text: text,
          ),
        );
        _typingUsers.remove(_geminiChatUser);
      });
    } on GenerativeAIException catch (e, stackTrace) {
      // Handle Gemini-specific errors (ServerException is a subtype of this)
      log('[ChatPage] ❌ GenerativeAIException during message send',
          name: 'ChatPage', error: e, stackTrace: stackTrace);
      log('[Error] Gemini API error: ${e.message}', name: 'ChatPage');

      // Check for 404 NOT_FOUND specifically
      if (e.message.contains('404') ||
          e.message.contains('NOT_FOUND') ||
          e.message.contains('not found')) {
        log('[Error] 🚨 Model not found: $_modelName', name: 'ChatPage');
        _showError('AI model not found. Please check the model configuration.');
      } else if (e.message.contains('API key')) {
        log('[Error] Invalid API key', name: 'ChatPage');
        _showError('Invalid API key. Please check your configuration.');
      } else if (e.message.contains('quota') || e.message.contains('429')) {
        log('[Error] Rate limit exceeded', name: 'ChatPage');
        _showError('Rate limit exceeded. Please try again in a few moments.');
      } else if (e.message.contains('SAFETY')) {
        log('[Error] Safety filter triggered', name: 'ChatPage');
        _showError(
            'Your message was blocked by safety filters. Please rephrase and try again.');
      } else {
        log('[Error] Unknown Gemini error: ${e.message}', name: 'ChatPage');
        _showError('AI service error: ${e.message}');
      }
    } catch (e, stackTrace) {
      log('[ChatPage] ❌ Unexpected error in getChatResponse',
          name: 'ChatPage', error: e, stackTrace: stackTrace);
      log('[Error] Error type: ${e.runtimeType}', name: 'ChatPage');

      if (e.toString().contains('timeout')) {
        log('[Error] Request timeout', name: 'ChatPage');
        _showError(
            'Request timeout. Please check your connection and try again.');
      } else if (e.toString().contains('SocketException') ||
          e.toString().contains('NetworkException')) {
        log('[Error] Network error', name: 'ChatPage');
        _showError('No internet connection. Please check your network.');
      } else {
        log('[Error] Unexpected error: ${e.toString()}', name: 'ChatPage');
        _showError('Unexpected error: ${e.toString()}');
      }
    }
  }

  /// Helper method to show error in chat and as SnackBar
  void _showError(String errorMessage) {
    log('[ChatPage] Showing error to user: $errorMessage', name: 'ChatPage');

    if (!mounted) return;

    // Show error message in chat
    setState(() {
      _messages.insert(
        0,
        ChatMessage(
          user: _geminiChatUser,
          createdAt: DateTime.now(),
          text: "⚠️ $errorMessage",
        ),
      );
      _typingUsers.remove(_geminiChatUser);
    });

    // Show snackbar for better visibility
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Dismiss',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
    }
  }
}
