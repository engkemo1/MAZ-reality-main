// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyBodyModel _$PropertyBodyModelFromJson(Map<String, dynamic> json) =>
    PropertyBodyModel(
      city: json['city'] as String,
      approved: json['approved'] as String,
      address: json['address'] as String,
      bathrooms: json['bathrooms'] as String,
      bedrooms: json['bedrooms'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      area: json['area'] as String,
    );

Map<String, dynamic> _$PropertyBodyModelToJson(PropertyBodyModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'approved': instance.approved,
      'address': instance.address,
      'bathrooms': instance.bathrooms,
      'bedrooms': instance.bedrooms,
      'price': instance.price,
      'description': instance.description,
      'name': instance.name,
      'area': instance.area,
    };
