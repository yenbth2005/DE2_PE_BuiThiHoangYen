// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeViewModel)
final themeViewModelProvider = ThemeViewModelProvider._();

final class ThemeViewModelProvider
    extends $AsyncNotifierProvider<ThemeViewModel, bool> {
  ThemeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeViewModelHash();

  @$internal
  @override
  ThemeViewModel create() => ThemeViewModel();
}

String _$themeViewModelHash() => r'23ce14d9d2d0ad4ca9f29e8eb587d1e453d74fbd';

abstract class _$ThemeViewModel extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
