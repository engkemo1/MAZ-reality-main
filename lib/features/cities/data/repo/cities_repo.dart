import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/search/data/model/city_response_model.dart';

class CitiesRepo {
  final ApiServices _apiServices;

  CitiesRepo(this._apiServices);

  Future<ApiResult<CityResponseModel>> getCities() async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.getCities("Bearer $token");

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
