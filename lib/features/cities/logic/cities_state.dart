import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities_state.freezed.dart';

@freezed
class CitiesState<T> with _$CitiesState<T> {
  const factory CitiesState.initial() = _Initial;

  const factory CitiesState.success(T data) = SUCCESS<T>;

  const factory CitiesState.loading() = Loading;

  const factory CitiesState.error({required String error}) = Error;
}
