
import 'package:json_annotation/json_annotation.dart';

part 'change_password_body.g.dart';

@JsonSerializable()
class ChangePasswordBody {
  final String passwordCurrent;
  final String password;
  final String passwordConfirm;

  ChangePasswordBody({
    required this.passwordCurrent,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}
