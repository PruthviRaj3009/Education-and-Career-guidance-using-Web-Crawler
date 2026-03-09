import 'package:flutter/foundation.dart';
import 'package:careerguidance/models/chat_message_model.dart';
import 'package:careerguidance/services/chat_service.dart';

/// Provider for managing chat state
///
/// Handles:
/// - Message list state
/// - Loading states
/// - Error handling
/// - API communication via ChatService
class ChatProvider extends ChangeNotifier {
  final ChatService _chatService;

  List<ChatMessageModel> _messages = [];
  bool _isLoading = false;
  String? _error;
  bool _isSending = false;

  ChatProvider({ChatService? chatService})
      : _chatService = chatService ?? ChatService();

  // Getters
  List<ChatMessageModel> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  bool get isSending => _isSending;
  String? get error => _error;
  bool get hasMessages => _messages.isNotEmpty;

  /// Send a message
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    if (_isSending) return; // Prevent multiple simultaneous sends

    _isSending = true;
    _error = null;

    // Create user message
    final userMessage = ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text.trim(),
      isUser: true,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );

    // Add user message to list
    _messages.insert(0, userMessage);
    notifyListeners();

    // Create bot message placeholder
    final botMessageId = '${DateTime.now().millisecondsSinceEpoch + 1}';
    final botMessage = ChatMessageModel(
      id: botMessageId,
      text: '',
      isUser: false,
      timestamp: DateTime.now(),
      status: MessageStatus.sending,
    );
    _messages.insert(0, botMessage);
    notifyListeners();

    try {
      // Get conversation history
      final history = _messages.reversed
          .where((msg) => msg.status == MessageStatus.sent)
          .map((msg) => msg.toConversationFormat())
          .toList();

      // Call API
      final response = await _chatService.sendMessage(
        userMessage: text.trim(),
        conversationHistory:
            history.sublist(0, history.length - 1), // Exclude current message
      );

      // Update bot message with response
      final index = _messages.indexWhere((msg) => msg.id == botMessageId);
      if (index != -1) {
        _messages[index] = botMessage.copyWith(
          text: response,
          status: MessageStatus.sent,
        );
      }

      _error = null;
    } on ChatException catch (e) {
      _error = e.message;

      // Update bot message with error
      final index = _messages.indexWhere((msg) => msg.id == botMessageId);
      if (index != -1) {
        _messages[index] = botMessage.copyWith(
          text: 'Error: ${e.message}',
          status: MessageStatus.error,
        );
      }
    } catch (e) {
      _error = 'Unexpected error: ${e.toString()}';

      // Update bot message with error
      final index = _messages.indexWhere((msg) => msg.id == botMessageId);
      if (index != -1) {
        _messages[index] = botMessage.copyWith(
          text: 'Sorry, something went wrong. Please try again.',
          status: MessageStatus.error,
        );
      }
    } finally {
      _isSending = false;
      notifyListeners();
    }
  }

  /// Clear error message
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Clear all messages
  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

  /// Load messages (for future persistence implementation)
  Future<void> loadMessages() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Load from local storage or Firebase
      // For now, start with empty list
      _messages = [];
    } catch (e) {
      _error = 'Failed to load messages';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Save messages (for future persistence implementation)
  Future<void> saveMessages() async {
    try {
      // TODO: Save to local storage or Firebase
    } catch (e) {
      debugPrint('Failed to save messages: $e');
    }
  }

  @override
  void dispose() {
    _chatService.dispose();
    super.dispose();
  }
}
