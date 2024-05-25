import 'package:json_annotation/json_annotation.dart';

part 'home_properties_response.g.dart';

@JsonSerializable()
class HomePropertiesResponse {
  String? status;
  int? results;
  @JsonKey(name: "data")
  Data? data;

  HomePropertiesResponse({this.status, this.results, this.data});

  factory HomePropertiesResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePropertiesResponseFromJson(json);
}

@JsonSerializable()
class Data {
  // @JsonKey(name: "data")
  // @JsonKey(name: "favorites")
  // @JsonKey(name: "properties")
  // @JsonKey(name: "ads")
  // List<Property>? properties;

  Data({this.properties});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  static somethingOrSomethingElse(map, string) {
    return map['data'] ?? map['favorites'] ?? map['properties']?? map['propertyNotApproved'] ?? map['ads'];
  }

  @JsonKey(readValue: somethingOrSomethingElse)
  late List<Property>? properties;
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
    this.isFavorite = false,
    this.bedrooms,
    this.bathrooms,
    this.id,
    this.area,
    this.name,
    this.description,
    this.price,
    this.address,
  });

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Property copyWith({
    User? owner,
    City? city,
    List<String>? images,
    bool? approved,
    bool? isFavorite,
    String? bedrooms,
    String? bathrooms,
    String? id,
    String? area,
    String? name,
    String? description,
    int? price,
    String? address,
    String? contract,
    String? createdAt,
    String? updatedAt,
  }) {
    return Property(
      owner: owner ?? this.owner,
      city: city ?? this.city,
      images: images ?? this.images,
      approved: approved ?? this.approved,
      isFavorite: isFavorite ?? this.isFavorite,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      id: id ?? this.id,
      area: area ?? this.area,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      address: address ?? this.address,
      // contract: contract ?? this.contract,
      // createdAt: createdAt ?? this.createdAt,
      // updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

@JsonSerializable()
class User {
  String? role;
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  String? password;
  @JsonKey(name: "__v")
  int? v;

  User(
      {this.role,
      this.phone,
      this.id,
      this.name,
      this.email,
      this.password,
      this.v});

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
