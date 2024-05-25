import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/edit_profile/data/models/update_response.dart';
import 'package:final_project/features/favorite/data/model/myfavorites_response.dart';

class MyFavoritesRepo {
  final ApiServices _apiServices;

  MyFavoritesRepo(
    this._apiServices,
  );

  Future<ApiResult<MyFavoritesResponse>> getMyFavorites() async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.getMyFavorites("Bearer $token");

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateResponse>> makeFavorite(String propId) async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response = await _apiServices.makeFavorite("Bearer $token", propId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UpdateResponse>> deleteFavorite(String propId) async {
    try {
      String token = await SharedPres.getToken() ?? '';

      final response =
          await _apiServices.deleteFavorite("Bearer $token", propId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
