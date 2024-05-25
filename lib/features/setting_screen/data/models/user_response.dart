
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  String? status;
  Data? data;

  UserInfoResponse({this.status, this.data});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);

}

@JsonSerializable()
class Data {
@JsonKey(name: 'data')
 User? user;

  Data({this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

}

@JsonSerializable()
class User {
 String? role;
 @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? whatsapp;
  String? phone;
  @JsonKey(name: '__v')
  int? iV;

  User({this.role, this.id, this.name, this.email,this.whatsapp,this.phone, this.iV});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}