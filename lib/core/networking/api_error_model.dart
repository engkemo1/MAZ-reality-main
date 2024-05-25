import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  @JsonKey(readValue: somethingOrSomethingElse)
  late String? status;

  ApiErrorModel({required this.message, this.status});

  static somethingOrSomethingElse(map, string) {
    return map['status']?.toString() ?? "";
  }

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
