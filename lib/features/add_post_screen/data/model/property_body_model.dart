import 'package:json_annotation/json_annotation.dart';
part 'property_body_model.g.dart';

@JsonSerializable()
class PropertyBodyModel {
  final String city, approved, address, bathrooms, bedrooms, price, description, name, area;
  PropertyBodyModel({
    required this.city,
    required this.approved,
    required this.address,
    required this.bathrooms,
    required this.bedrooms,
    required this.price,
    required this.description,
    required this.name,
    required this.area,
  });


  Map<String, dynamic> toJson() => _$PropertyBodyModelToJson(this);

}
