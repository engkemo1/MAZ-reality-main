// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_properties_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePropertiesResponse _$HomePropertiesResponseFromJson(
        Map<String, dynamic> json) =>
    HomePropertiesResponse(
      status: json['status'] as String?,
      results: (json['results'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomePropertiesResponseToJson(
        HomePropertiesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      properties:
          (Data.somethingOrSomethingElse(json, 'properties') as List<dynamic>?)
              ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'properties': instance.properties,
    };

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      approved: json['approved'] as bool?,
      isFavorite: json['isFavorite'] as bool? ?? false,
      bedrooms: json['bedrooms'] as String?,
      bathrooms: json['bathrooms'] as String?,
      id: json['_id'] as String?,
      area: json['area'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      address: json['address'] as String?,
    )
      ..contract = json['contract'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'owner': instance.owner,
      'city': instance.city,
      'images': instance.images,
      'approved': instance.approved,
      'isFavorite': instance.isFavorite,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      '_id': instance.id,
      'area': instance.area,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'address': instance.address,
      'contract': instance.contract,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      role: json['role'] as String?,
      phone: json['phone'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'role': instance.role,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      '__v': instance.v,
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
