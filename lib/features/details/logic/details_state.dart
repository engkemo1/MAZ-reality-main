import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_state.freezed.dart';

@freezed
class DetailsState<T> with _$DetailsState<T> {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.loading() = Loading;
  const factory DetailsState.success(T data) = SUCCESS<T>;
  const factory DetailsState.error({required String error}) = Error;
}
