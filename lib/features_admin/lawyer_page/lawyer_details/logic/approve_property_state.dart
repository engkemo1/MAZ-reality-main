import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_property_state.freezed.dart';

@freezed
class ApprovePropertyState<T> with _$ApprovePropertyState<T> {
  const factory ApprovePropertyState.initial() = _Initial;

  const factory ApprovePropertyState.loading() = Loading;

  const factory ApprovePropertyState.successApproved(T data) = successApproved<T>;

  const factory ApprovePropertyState.successReject(T data) = successReject<T>;

  const factory ApprovePropertyState.error({required String error}) = Error;
}
