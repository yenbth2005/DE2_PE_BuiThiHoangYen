// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chi_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chiRepository)
final chiRepositoryProvider = ChiRepositoryProvider._();

final class ChiRepositoryProvider
    extends $FunctionalProvider<ChiRepository, ChiRepository, ChiRepository>
    with $Provider<ChiRepository> {
  ChiRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chiRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chiRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChiRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChiRepository create(Ref ref) {
    return chiRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChiRepository>(value),
    );
  }
}

String _$chiRepositoryHash() => r'f8e6d24e974446f4a32495ab06e0da066481bbe6';
