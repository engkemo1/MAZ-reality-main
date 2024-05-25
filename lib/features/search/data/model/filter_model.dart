import 'package:final_project/features/edit_profile/data/models/update_response.dart';

import 'filter_model.dart';

class PropertiesModel {
  String? status;
  int? results;
  Data? data;

  PropertiesModel({this.status, this.results, this.data});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<FilterData>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FilterData>[];
      json['data'].forEach((v) {
        data!.add(new FilterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FilterData {
  Owner? owner;
  City? city;
  List<String>? images;
  bool? approved;
  int? bedrooms;
  int? bathrooms;
  String? type;
  String? transaction;
  bool? furnished;
  int? level;
  String? sId;
  String? name;
  int? price;
  String? address;
  String? latitude;
  String? longitude;
  int? area;
  String? contract;
  String? description;
  String? createdAt;
  String? updatedAt;
  bool? isFav;

  FilterData(
      {this.owner,
        this.city,
        this.images,
        this.approved,
        this.bedrooms,
        this.bathrooms,
        this.type,
        this.transaction,
        this.furnished,
        this.level,
        this.sId,
        this.name,
        this.price,
        this.address,
        this.latitude,
        this.longitude,
        this.area,
        this.contract,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.isFav});

  FilterData.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    images = json['images'].cast<String>();
    approved = json['approved'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    type = json['type'];
    transaction = json['transaction'];
    furnished = json['Furnished'];
    level = json['level'];
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    area = json['area'];
    contract = json['contract'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isFav = json['isFav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['images'] = this.images;
    data['approved'] = this.approved;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['type'] = this.type;
    data['transaction'] = this.transaction;
    data['Furnished'] = this.furnished;
    data['level'] = this.level;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['area'] = this.area;
    data['contract'] = this.contract;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isFav'] = this.isFav;
    return data;
  }
}

class Owner {
  String? sId;
  String? name;
  String? photo;
  String? email;
  String? phone;
  String? whatsapp;

  Owner(
      {this.sId, this.name, this.photo, this.email, this.phone, this.whatsapp});

  Owner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}

class City {
  String? sId;
  String? cityNameAr;
  String? cityNameEn;

  City({this.sId, this.cityNameAr, this.cityNameEn});

  City.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityNameAr = json['city_name_ar'];
    cityNameEn = json['city_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['city_name_ar'] = this.cityNameAr;
    data['city_name_en'] = this.cityNameEn;
    return data;
  }
}
