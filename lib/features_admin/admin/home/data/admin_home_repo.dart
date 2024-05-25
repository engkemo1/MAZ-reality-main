import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';

class AdminHomeRepo {
  final ApiServices _apiServices;

  AdminHomeRepo(
    this._apiServices,
  );

  Future<ApiResult<HomePropertiesResponse>> getAdminPendingPosts(int page) async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.getAdminHome("Bearer $token", /*page*/);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
