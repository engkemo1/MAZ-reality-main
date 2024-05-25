import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
class MyFavoritesState<T> with _$MyFavoritesState<T> {
  const factory MyFavoritesState.initial() = _Initial;
  const factory MyFavoritesState.loading() = Loading;

  const factory MyFavoritesState.success(T data) = SUCCESS<T>;

  const factory MyFavoritesState.error({required String error}) = Error;
}
