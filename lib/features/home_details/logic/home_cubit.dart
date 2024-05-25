import 'package:dio/dio.dart';
import 'package:final_project/features/add_post_screen/data/model/property_body_model.dart';
import 'package:final_project/features/home_details/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../search/data/model/filter_model.dart';
import '../data/models/home_properties_response.dart';
import '../data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  final HomeRepo _homeRepo;

  Future getAllPosts(int page, {String? cityId}) async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getAllPosts(page, cityId: cityId);

    response.when(success: (data) {
      emit(HomeState.success(data));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
    return response;
  }

  Future getAllPosts2({dynamic bathrooms,
    String? property,
    dynamic maxPrice,
    dynamic minPrice,
    String? transaction,
    String? cityId,
    dynamic bedrooms,
    dynamic maxAreaSize, dynamic minAreaSize,dynamic furnished,dynamic level}) async {
    List<FilterData> properties = [];
    Map<String, dynamic> queryParams = {};

    // Add the "bathrooms" parameter if it's not null
    if (bathrooms != null && bathrooms != 0) {
      queryParams['bathrooms'] = bathrooms;
    }
    if (property != null) {
      queryParams["type"] = property;
    }
    if (maxPrice != null && maxPrice != 0) {
      queryParams["price[lte]"] = maxPrice;
    }
    if (minPrice != null && minPrice != 0) {
      queryParams["price[gte]"] = minPrice;
    }
    if (transaction != null) {
      queryParams["transaction"] = transaction;
    }
    if (cityId != null) {
      queryParams["city._id"] = cityId;
    }
    if (furnished != null) {
      queryParams["Furnished"] = furnished;
    }
    if (maxAreaSize != null && maxAreaSize != 0) {
      queryParams["area[gte]"] = maxAreaSize;
    }
    if (minAreaSize != null && minAreaSize != 0) {
      queryParams["area[lte]"] = minAreaSize;
    }
    if (level != null && level != 0) {
      queryParams["level"] = level;
    }
    if (bedrooms != null && bedrooms != 0) {
      queryParams["bedrooms[gt]"] = bedrooms;
    }
    try {
      Response response = await Dio().get(
          "https://mazrealty-live.onrender.com/api/v1/properties",
          queryParameters: queryParams).then((value) {
        properties = (value.data["data"]["data"] as List)
            .map((e) => FilterData.fromJson(e))
            .toList();
print(value.realUri);
        return value;
      });
    } catch (e) {
      return e;
    }
    return properties;
  }

 Future get0neProperty(String id)async{
    print(id);
    FilterData property=FilterData();
    try {
      Response response = await Dio().get(
          "https://mazrealty-live.onrender.com/api/v1/properties/$id",
          ).then((value) {
        property =
            FilterData.fromJson(value.data["data"]["data"]);
        print(property);
        print(value.realUri);
        return value;
      });
    } catch (e) {
      return e;
    }
    return property;

  }

}