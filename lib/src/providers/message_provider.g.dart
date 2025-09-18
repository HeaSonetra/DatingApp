// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageServiceHash() => r'17cb7cf318f1040fd8362e6f9892818f3b1db5aa';

/// See also [messageService].
@ProviderFor(messageService)
final messageServiceProvider = AutoDisposeProvider<MessageService>.internal(
  messageService,
  name: r'messageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MessageServiceRef = AutoDisposeProviderRef<MessageService>;
String _$conversationsHash() => r'24aad2ba322f49132fa9403cc5ab8e2db7d9adca';

/// See also [conversations].
@ProviderFor(conversations)
final conversationsProvider =
    AutoDisposeFutureProvider<List<Conversation>>.internal(
  conversations,
  name: r'conversationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conversationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConversationsRef = AutoDisposeFutureProviderRef<List<Conversation>>;
String _$messagesHash() => r'5022162b84f07a52532fcc3a31cd4197c3e42dd4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [messages].
@ProviderFor(messages)
const messagesProvider = MessagesFamily();

/// See also [messages].
class MessagesFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [messages].
  const MessagesFamily();

  /// See also [messages].
  MessagesProvider call(
    String conversationId,
  ) {
    return MessagesProvider(
      conversationId,
    );
  }

  @override
  MessagesProvider getProviderOverride(
    covariant MessagesProvider provider,
  ) {
    return call(
      provider.conversationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messagesProvider';
}

/// See also [messages].
class MessagesProvider extends AutoDisposeFutureProvider<List<Message>> {
  /// See also [messages].
  MessagesProvider(
    String conversationId,
  ) : this._internal(
          (ref) => messages(
            ref as MessagesRef,
            conversationId,
          ),
          from: messagesProvider,
          name: r'messagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messagesHash,
          dependencies: MessagesFamily._dependencies,
          allTransitiveDependencies: MessagesFamily._allTransitiveDependencies,
          conversationId: conversationId,
        );

  MessagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  Override overrideWith(
    FutureOr<List<Message>> Function(MessagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessagesProvider._internal(
        (ref) => create(ref as MessagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Message>> createElement() {
    return _MessagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesProvider && other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MessagesRef on AutoDisposeFutureProviderRef<List<Message>> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _MessagesProviderElement
    extends AutoDisposeFutureProviderElement<List<Message>> with MessagesRef {
  _MessagesProviderElement(super.provider);

  @override
  String get conversationId => (origin as MessagesProvider).conversationId;
}

String _$conversationHash() => r'68ab826cceb741d3b80f3a71cbf9a334373ea5cd';

/// See also [conversation].
@ProviderFor(conversation)
const conversationProvider = ConversationFamily();

/// See also [conversation].
class ConversationFamily extends Family<AsyncValue<Conversation?>> {
  /// See also [conversation].
  const ConversationFamily();

  /// See also [conversation].
  ConversationProvider call(
    String conversationId,
  ) {
    return ConversationProvider(
      conversationId,
    );
  }

  @override
  ConversationProvider getProviderOverride(
    covariant ConversationProvider provider,
  ) {
    return call(
      provider.conversationId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'conversationProvider';
}

/// See also [conversation].
class ConversationProvider extends AutoDisposeFutureProvider<Conversation?> {
  /// See also [conversation].
  ConversationProvider(
    String conversationId,
  ) : this._internal(
          (ref) => conversation(
            ref as ConversationRef,
            conversationId,
          ),
          from: conversationProvider,
          name: r'conversationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$conversationHash,
          dependencies: ConversationFamily._dependencies,
          allTransitiveDependencies:
              ConversationFamily._allTransitiveDependencies,
          conversationId: conversationId,
        );

  ConversationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  Override overrideWith(
    FutureOr<Conversation?> Function(ConversationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConversationProvider._internal(
        (ref) => create(ref as ConversationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Conversation?> createElement() {
    return _ConversationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConversationProvider &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConversationRef on AutoDisposeFutureProviderRef<Conversation?> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _ConversationProviderElement
    extends AutoDisposeFutureProviderElement<Conversation?>
    with ConversationRef {
  _ConversationProviderElement(super.provider);

  @override
  String get conversationId => (origin as ConversationProvider).conversationId;
}

String _$unreadMessageCountHash() =>
    r'9ed16e2bf976e62dd645146478b79b1290b9abd2';

/// See also [unreadMessageCount].
@ProviderFor(unreadMessageCount)
final unreadMessageCountProvider = AutoDisposeFutureProvider<int>.internal(
  unreadMessageCount,
  name: r'unreadMessageCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadMessageCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnreadMessageCountRef = AutoDisposeFutureProviderRef<int>;
String _$messageSenderHash() => r'363e0d463d08a159185811cd688bd2f3f0bc945e';

/// See also [MessageSender].
@ProviderFor(MessageSender)
final messageSenderProvider =
    AutoDisposeNotifierProvider<MessageSender, bool>.internal(
  MessageSender.new,
  name: r'messageSenderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageSenderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MessageSender = AutoDisposeNotifier<bool>;
String _$activeConversationHash() =>
    r'6bc877a38da28436ca5e965400d75ee2405a4a5d';

/// See also [ActiveConversation].
@ProviderFor(ActiveConversation)
final activeConversationProvider =
    AutoDisposeNotifierProvider<ActiveConversation, String?>.internal(
  ActiveConversation.new,
  name: r'activeConversationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeConversationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveConversation = AutoDisposeNotifier<String?>;
String _$messageInputHash() => r'037d70ae43c4f98ef93b3fde97c75db0aaf388ab';

/// See also [MessageInput].
@ProviderFor(MessageInput)
final messageInputProvider =
    AutoDisposeNotifierProvider<MessageInput, String>.internal(
  MessageInput.new,
  name: r'messageInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$messageInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MessageInput = AutoDisposeNotifier<String>;
String _$typingIndicatorHash() => r'88fdf138af04b3b48249becb94fa277c687e90dc';

/// See also [TypingIndicator].
@ProviderFor(TypingIndicator)
final typingIndicatorProvider =
    AutoDisposeNotifierProvider<TypingIndicator, Map<String, bool>>.internal(
  TypingIndicator.new,
  name: r'typingIndicatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$typingIndicatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TypingIndicator = AutoDisposeNotifier<Map<String, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
