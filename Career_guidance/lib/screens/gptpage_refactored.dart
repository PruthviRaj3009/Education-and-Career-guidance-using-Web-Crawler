import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:careerguidance/providers/chat_provider.dart';
import 'package:careerguidance/models/chat_message_model.dart';

/// Production-ready Chat Page
/// 
/// Improvements:
/// - Separation of concerns (UI vs Business Logic)
/// - Proper state management with Provider
/// - Better error handling
/// - Performance optimizations
/// - User data from Firebase Auth
/// - Loading states
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatUser _currentUser;
  late final ChatUser _aiUser;

  @override
  void initState() {
    super.initState();
    _initializeUsers();
    
    // Load messages when widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatProvider>().loadMessages();
    });
  }

  void _initializeUsers() {
    // Get current Firebase user
    final firebaseUser = FirebaseAuth.instance.currentUser;
    
    _currentUser = ChatUser(
      id: firebaseUser?.uid ?? '1',
      firstName: firebaseUser?.displayName?.split(' ').first ?? 'User',
      lastName: firebaseUser?.displayName?.split(' ').skip(1).join(' '),
      profileImage: firebaseUser?.photoURL,
    );

    _aiUser = ChatUser(
      id: 'ai',
      firstName: 'Career',
      lastName: 'Assistant',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: _buildAppBar(),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          return Column(
            children: [
              // Error banner
              if (chatProvider.error != null) _buildErrorBanner(chatProvider),
              
              // Chat interface
              Expanded(
                child: chatProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _buildChatInterface(chatProvider),
              ),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
      actions: [
        Consumer<ChatProvider>(
          builder: (context, chatProvider, child) {
            if (!chatProvider.hasMessages) return const SizedBox.shrink();
            
            return IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Clear conversation',
              onPressed: () => _showClearConfirmation(context),
            );
          },
        ),
      ],
    );
  }

  Widget _buildErrorBanner(ChatProvider chatProvider) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.red.shade100,
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              chatProvider.error!,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            iconSize: 20,
            onPressed: () => chatProvider.clearError(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatInterface(ChatProvider chatProvider) {
    return DashChat(
      currentUser: _currentUser,
      onSend: (ChatMessage message) => _onSendMessage(message, chatProvider),
      messages: _convertToDashChatMessages(chatProvider.messages),
      typingUsers: chatProvider.isSending ? [_aiUser] : [],
      messageOptions: _buildMessageOptions(),
      inputOptions: _buildInputOptions(chatProvider),
    );
  }

  MessageOptions _buildMessageOptions() {
    return const MessageOptions(
      currentUserContainerColor: Color(0xFF2563EB),
      containerColor: Colors.white,
      textColor: Color(0xFF1F2937),
      currentUserTextColor: Colors.white,
      borderRadius: 16,
      messagePadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
    );
  }

  InputOptions _buildInputOptions(ChatProvider chatProvider) {
    return InputOptions(
      inputDisabled: chatProvider.isSending,
      inputDecoration: InputDecoration(
        hintText: chatProvider.isSending 
            ? 'Waiting for response...' 
            : 'Type your message...',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2),
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: chatProvider.isSending 
                ? Colors.grey 
                : const Color(0xFF2563EB),
          ),
          child: IconButton(
            icon: const Icon(Icons.send, color: Colors.white, size: 20),
            onPressed: chatProvider.isSending ? null : send,
          ),
        );
      },
    );
  }

  void _onSendMessage(ChatMessage message, ChatProvider chatProvider) {
    if (message.text.trim().isEmpty) return;
    chatProvider.sendMessage(message.text);
  }

  List<ChatMessage> _convertToDashChatMessages(List<ChatMessageModel> messages) {
    return messages.map((msg) {
      return ChatMessage(
        user: msg.isUser ? _currentUser : _aiUser,
        createdAt: msg.timestamp,
        text: msg.text,
        customProperties: {
          'status': msg.status.toString(),
        },
      );
    }).toList();
  }

  void _showClearConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Clear Conversation'),
          content: const Text(
            'Are you sure you want to clear all messages? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<ChatProvider>().clearMessages();
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Clear',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Save messages before disposing
    context.read<ChatProvider>().saveMessages();
    super.dispose();
  }
}
