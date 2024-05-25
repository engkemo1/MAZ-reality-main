import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? status;
  String? token;
  @JsonKey(name: "data")
  Data? data;
  SignupResponse({this.status, this.token, this.data});
  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "user")
  User? user;
  Data({this.user});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class User {
  String? role;
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? email;
  String? password;
  @JsonKey(name: "__v")
  int? v;
  User({this.role, this.id, this.name, this.email,this.password, this.v});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
