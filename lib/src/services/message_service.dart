import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/message.dart';

class MessageService {
  List<Conversation>? _cachedConversations;
  List<Message>? _cachedMessages;

  Future<List<Conversation>> getConversations() async {
    // Load conversations from mock data if not cached
    _cachedConversations ??= await _loadMockConversations();

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    return List.from(_cachedConversations!);
  }

  Future<List<Message>> getMessages(String conversationId) async {
    // Load messages from mock data if not cached
    _cachedMessages ??= await _loadMockMessages();

    // Filter messages for the specific conversation
    // In this mock implementation, we'll return messages based on participants
    final conversation = await getConversationById(conversationId);
    if (conversation == null) return <Message>[];

    final otherParticipant = conversation.participants.firstWhere(
      (id) => id != 'current_user',
      orElse: () => '',
    );

    final messages = _cachedMessages!.where((message) {
      return (message.senderId == 'current_user' &&
              message.receiverId == otherParticipant) ||
          (message.senderId == otherParticipant &&
              message.receiverId == 'current_user');
    }).toList();

    // Sort by timestamp (newest first for display)
    messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));

    return messages;
  }

  Future<Conversation?> getConversationById(String conversationId) async {
    _cachedConversations ??= await _loadMockConversations();

    try {
      return _cachedConversations!.firstWhere(
        (conv) => conv.id == conversationId,
      );
    } catch (e) {
      return null;
    }
  }

  Future<bool> sendMessage(String receiverId, String content) async {
    // Simulate sending message
    await Future.delayed(const Duration(milliseconds: 500));

    final message = Message(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      senderId: 'current_user',
      receiverId: receiverId,
      content: content,
      timestamp: DateTime.now(),
      isRead: false,
    );

    // In a real app, this would be sent to the server
    // For now, we'll just add it to our cached messages
    _cachedMessages ??= await _loadMockMessages();
    _cachedMessages!.add(message);

    // Update conversation with new last message
    await _updateConversationLastMessage(receiverId, content);

    return true;
  }

  Future<bool> markMessageAsRead(String messageId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 100));

    _cachedMessages ??= await _loadMockMessages();

    final messageIndex = _cachedMessages!.indexWhere(
      (msg) => msg.id == messageId,
    );
    if (messageIndex != -1) {
      _cachedMessages![messageIndex] = _cachedMessages![messageIndex].copyWith(
        isRead: true,
      );
      return true;
    }

    return false;
  }

  Future<void> _updateConversationLastMessage(
    String otherUserId,
    String lastMessage,
  ) async {
    _cachedConversations ??= await _loadMockConversations();

    final conversationIndex = _cachedConversations!.indexWhere(
      (conv) => conv.participants.contains(otherUserId),
    );

    if (conversationIndex != -1) {
      _cachedConversations![conversationIndex] =
          _cachedConversations![conversationIndex].copyWith(
            lastMessage: lastMessage,
            lastMessageTime: DateTime.now(),
          );
    } else {
      // Create new conversation
      final newConversation = Conversation(
        id: 'conv_${DateTime.now().millisecondsSinceEpoch}',
        participants: ['current_user', otherUserId],
        lastMessage: lastMessage,
        lastMessageTime: DateTime.now(),
        unreadCount: 0,
      );
      _cachedConversations!.add(newConversation);
    }
  }

  Future<List<Conversation>> _loadMockConversations() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/mock/conversations.json',
      );
      final List<dynamic> data = jsonDecode(response) as List<dynamic>;

      return data
          .map((json) => Conversation.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return <Conversation>[];
    }
  }

  Future<List<Message>> _loadMockMessages() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/mock/messages.json',
      );
      final List<dynamic> data = jsonDecode(response) as List<dynamic>;

      return data
          .map((json) => Message.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return <Message>[];
    }
  }
}
