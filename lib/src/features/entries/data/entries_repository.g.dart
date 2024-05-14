// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$entriesRepositoryHash() => r'b372d27ef1dca2699bbc980d86a778328a7cf730';

/// See also [entriesRepository].
@ProviderFor(entriesRepository)
final entriesRepositoryProvider = Provider<EntriesRepository>.internal(
  entriesRepository,
  name: r'entriesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$entriesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EntriesRepositoryRef = ProviderRef<EntriesRepository>;
String _$entriesQueryHash() => r'41a7a9b394796166a2393d8258e0ce3a16935afb';

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

/// See also [entriesQuery].
@ProviderFor(entriesQuery)
const entriesQueryProvider = EntriesQueryFamily();

/// See also [entriesQuery].
class EntriesQueryFamily extends Family<Query<Entry>> {
  /// See also [entriesQuery].
  const EntriesQueryFamily();

  /// See also [entriesQuery].
  EntriesQueryProvider call(
    String jobId,
  ) {
    return EntriesQueryProvider(
      jobId,
    );
  }

  @override
  EntriesQueryProvider getProviderOverride(
    covariant EntriesQueryProvider provider,
  ) {
    return call(
      provider.jobId,
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
  String? get name => r'entriesQueryProvider';
}

/// See also [entriesQuery].
class EntriesQueryProvider extends AutoDisposeProvider<Query<Entry>> {
  /// See also [entriesQuery].
  EntriesQueryProvider(
    String jobId,
  ) : this._internal(
          (ref) => entriesQuery(
            ref as EntriesQueryRef,
            jobId,
          ),
          from: entriesQueryProvider,
          name: r'entriesQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$entriesQueryHash,
          dependencies: EntriesQueryFamily._dependencies,
          allTransitiveDependencies:
              EntriesQueryFamily._allTransitiveDependencies,
          jobId: jobId,
        );

  EntriesQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jobId,
  }) : super.internal();

  final String jobId;

  @override
  Override overrideWith(
    Query<Entry> Function(EntriesQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntriesQueryProvider._internal(
        (ref) => create(ref as EntriesQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jobId: jobId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Query<Entry>> createElement() {
    return _EntriesQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntriesQueryProvider && other.jobId == jobId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jobId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EntriesQueryRef on AutoDisposeProviderRef<Query<Entry>> {
  /// The parameter `jobId` of this provider.
  String get jobId;
}

class _EntriesQueryProviderElement
    extends AutoDisposeProviderElement<Query<Entry>> with EntriesQueryRef {
  _EntriesQueryProviderElement(super.provider);

  @override
  String get jobId => (origin as EntriesQueryProvider).jobId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
