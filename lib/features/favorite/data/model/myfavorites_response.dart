import 'package:json_annotation/json_annotation.dart';

part 'myfavorites_response.g.dart';

@JsonSerializable()
class MyFavoritesResponse {
  String? status;
  int? results;
  @JsonKey(name: "data")
  Data? data;

  MyFavoritesResponse({this.status, this.results, this.data});

  factory MyFavoritesResponse.fromJson(Map<String, dynamic> json) => _$MyFavoritesResponseFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "favorites")
  List<Favorite>? favorites;

  Data({this.favorites});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Favorite {
  @JsonKey(name: "_id")
  String? id;
  String? user;
  @JsonKey(name: "property")
  Property? property;

  Favorite({this.property,this.id,this.user});

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
}
@JsonSerializable()
class Property {
  User? owner;
  City? city;
  List<String>? images;
  bool? approved;
  bool? isFavorite;
  String? bedrooms;
  String? bathrooms;
  @JsonKey(name: "_id")
  String? id;
  String? area;
  String? name;
  String? description;
  int? price;
  String? address;
  String? contract, createdAt, updatedAt;

  Property({
    this.owner,
    this.city,
    this.images,
    this.approved,
    this.isFavorite,
    this.bedrooms,
    this.bathrooms,
    this.id,
    this.area,
    this.name,
    this.description,
    this.price,
    this.address,
  });

  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);
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

  String? phone;

  User({this.role, this.id, this.name, this.phone, this.email, this.password, this.v});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
