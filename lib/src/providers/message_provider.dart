import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/message.dart';
import '../services/message_service.dart';

part 'message_provider.g.dart';

// Message service provider
@riverpod
MessageService messageService(MessageServiceRef ref) {
  return MessageService();
}

// Conversations provider
@riverpod
Future<List<Conversation>> conversations(ConversationsRef ref) async {
  final messageService = ref.watch(messageServiceProvider);
  return messageService.getConversations();
}

// Messages for a specific conversation
@riverpod
Future<List<Message>> messages(MessagesRef ref, String conversationId) async {
  final messageService = ref.watch(messageServiceProvider);
  return messageService.getMessages(conversationId);
}

// Single conversation provider
@riverpod
Future<Conversation?> conversation(
  ConversationRef ref,
  String conversationId,
) async {
  final messageService = ref.watch(messageServiceProvider);
  return messageService.getConversationById(conversationId);
}

// Message sending provider
@riverpod
class MessageSender extends _$MessageSender {
  @override
  bool build() => false; // Loading state

  Future<bool> sendMessage(String receiverId, String content) async {
    state = true; // Set loading

    try {
      final messageService = ref.read(messageServiceProvider);
      final success = await messageService.sendMessage(receiverId, content);

      if (success) {
        // Invalidate conversations and messages to refresh the UI
        ref.invalidate(conversationsProvider);
        // Note: We'd need the conversation ID to invalidate specific messages
        // In a real app, you'd have better state management for this
      }

      return success;
    } finally {
      state = false; // Clear loading
    }
  }
}

// Unread message count provider
@riverpod
Future<int> unreadMessageCount(UnreadMessageCountRef ref) async {
  final conversations = await ref.watch(conversationsProvider.future);
  return conversations.fold<int>(0, (total, conv) => total + conv.unreadCount);
}

// Active conversation provider (for chat screen)
@riverpod
class ActiveConversation extends _$ActiveConversation {
  @override
  String? build() => null;

  void setActiveConversation(String? conversationId) {
    state = conversationId;
  }

  void clearActiveConversation() {
    state = null;
  }
}

// Message input provider (for chat screen)
@riverpod
class MessageInput extends _$MessageInput {
  @override
  String build() => '';

  void updateInput(String input) {
    state = input;
  }

  void clearInput() {
    state = '';
  }
}

// Typing indicator provider
@riverpod
class TypingIndicator extends _$TypingIndicator {
  @override
  Map<String, bool> build() => <String, bool>{};

  void setTyping(String userId, bool isTyping) {
    state = {...state, userId: isTyping};
  }

  bool isUserTyping(String userId) {
    return state[userId] ?? false;
  }
}
