
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request_body.g.dart';
@JsonSerializable()

class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  SignupRequestBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.passwordConfirm});

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);     
}
