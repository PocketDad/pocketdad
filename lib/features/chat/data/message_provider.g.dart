// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageDatabaseHash() => r'ab710ee3a285e6383e4442b422c2c53eb97bf82e';

/// See also [messageDatabase].
@ProviderFor(messageDatabase)
final messageDatabaseProvider = AutoDisposeProvider<MessageDatabase>.internal(
  messageDatabase,
  name: r'messageDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MessageDatabaseRef = AutoDisposeProviderRef<MessageDatabase>;
String _$messagesHash() => r'c9c0f5931bdae9842f21b8b1a37274786b924521';

/// See also [messages].
@ProviderFor(messages)
final messagesProvider = AutoDisposeStreamProvider<List<Message>>.internal(
  messages,
  name: r'messagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$messagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MessagesRef = AutoDisposeStreamProviderRef<List<Message>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
