import 'package:json_annotation/json_annotation.dart';
part 'city_response_model.g.dart';
@JsonSerializable()
class CityResponseModel {
  CityResponseModel({this.cities});

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityResponseModelFromJson(json);

  static somethingOrSomethingElse(map, string) {
    return map['data']?['data'] ?? map['data'];
  }

  @JsonKey(readValue: somethingOrSomethingElse)
  late List<City>? cities;
}

@JsonSerializable()
class City {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "city_name_ar")
  String? nameAr;
  @JsonKey(name: "city_name_en")
  String? nameEn;

  City({
    this.id,
    this.nameAr,
    this.nameEn,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
