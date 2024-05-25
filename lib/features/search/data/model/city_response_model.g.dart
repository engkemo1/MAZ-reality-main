// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponseModel _$CityResponseModelFromJson(Map<String, dynamic> json) =>
    CityResponseModel(
      cities: (CityResponseModel.somethingOrSomethingElse(json, 'cities')
              as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityResponseModelToJson(CityResponseModel instance) =>
    <String, dynamic>{
      'cities': instance.cities,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['_id'] as String?,
      nameAr: json['city_name_ar'] as String?,
      nameEn: json['city_name_en'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      '_id': instance.id,
      'city_name_ar': instance.nameAr,
      'city_name_en': instance.nameEn,
    };
