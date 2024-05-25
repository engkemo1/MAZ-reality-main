
import 'package:json_annotation/json_annotation.dart';

part 'update_request_body.g.dart';

@JsonSerializable()
class UpdateRequestBody {
  final String name;
  final String email;
  final String phone;

  UpdateRequestBody({
    required this.name,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$UpdateRequestBodyToJson(this);
}
