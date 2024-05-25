import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/search/data/model/filter_model.dart';

class HomeRepo {
  final ApiServices _apiServices;

  HomeRepo(
    this._apiServices,
  );

  Future<ApiResult<PropertiesModel>> getAllPosts(int page,{String? cityId}) async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.getAllPosts(token, page,cityId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
