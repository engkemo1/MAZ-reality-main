import 'package:freezed_annotation/freezed_annotation.dart';

part  'admin_home_state.freezed.dart';

@freezed
class AdminHomeState<T> with _$AdminHomeState<T> {
  const factory AdminHomeState.initial() = _Initial;

  const factory AdminHomeState.loading() = Loading;

  const factory AdminHomeState.success(T data) = SUCCESS<T>;

  const factory AdminHomeState.error({required String error}) = Error;
}
