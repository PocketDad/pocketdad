// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversationMessage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$conversationMessageDatabaseHash() =>
    r'9703ca99f81f0d4f592e04897477ba8136eac1bd';

/// See also [conversationMessageDatabase].
@ProviderFor(conversationMessageDatabase)
final conversationMessageDatabaseProvider =
    AutoDisposeProvider<ConversationMessageDatabase>.internal(
  conversationMessageDatabase,
  name: r'conversationMessageDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conversationMessageDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConversationMessageDatabaseRef
    = AutoDisposeProviderRef<ConversationMessageDatabase>;
String _$conversationMessagesHash() =>
    r'd4eb1821a50e086d2d61290fcca0c20a7c03202d';

/// See also [conversationMessages].
@ProviderFor(conversationMessages)
final conversationMessagesProvider =
    AutoDisposeStreamProvider<List<ConversationMessage>>.internal(
  conversationMessages,
  name: r'conversationMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conversationMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConversationMessagesRef
    = AutoDisposeStreamProviderRef<List<ConversationMessage>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
