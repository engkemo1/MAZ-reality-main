import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_property_state.freezed.dart';

@freezed
class AddPropertyState<T> with _$AddPropertyState<T> {
  const factory AddPropertyState.initial() = _Initial;

  const factory AddPropertyState.loading() = Loading;

  const factory AddPropertyState.success(T data) = SUCCESS<T>;

  const factory AddPropertyState.error({required String error}) = Error;
}
