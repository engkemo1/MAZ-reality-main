part of 'signup_cubit.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  
  const factory SignupState.signupLoading()=SignupLoadind;
  const factory SignupState.signupSuccess(T data) = SignupSUCCESS<T>;
  const factory SignupState.signupError({required String error}) = SignupError;
}
