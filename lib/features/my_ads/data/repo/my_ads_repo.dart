import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';

class MyAdsRepo {
  final ApiServices _apiServices;

  MyAdsRepo(
    this._apiServices,
  );

  Future<ApiResult<HomePropertiesResponse>> getMyAds() async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.getMyAds("Bearer $token");

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
