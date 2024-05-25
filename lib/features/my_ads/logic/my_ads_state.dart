import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_ads_state.freezed.dart';

@freezed
class MyAdsState<T> with _$MyAdsState<T> {
  const factory MyAdsState.initial() = _Initial;
  const factory MyAdsState.loading() = Loading;

  const factory MyAdsState.success(T data) = SUCCESS<T>;

  const factory MyAdsState.error({required String error}) = Error;
}
