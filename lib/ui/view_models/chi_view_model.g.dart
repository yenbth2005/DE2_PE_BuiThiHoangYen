// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chi_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChiViewModel)
final chiViewModelProvider = ChiViewModelProvider._();

final class ChiViewModelProvider
    extends $AsyncNotifierProvider<ChiViewModel, List<Chi>> {
  ChiViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chiViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chiViewModelHash();

  @$internal
  @override
  ChiViewModel create() => ChiViewModel();
}

String _$chiViewModelHash() => r'c5e71d8260d21c5f2c77eaf3522012a8605264f7';

abstract class _$ChiViewModel extends $AsyncNotifier<List<Chi>> {
  FutureOr<List<Chi>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Chi>>, List<Chi>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Chi>>, List<Chi>>,
              AsyncValue<List<Chi>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
