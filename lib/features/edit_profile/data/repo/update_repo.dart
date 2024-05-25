import 'dart:io';

import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/edit_profile/data/models/change_password_body.dart';
import 'package:final_project/features/edit_profile/data/models/update_request_body.dart';
import 'package:final_project/features/edit_profile/data/models/update_response.dart';

class UpdateRepo {
  final ApiServices apiServices;

  UpdateRepo(
    this.apiServices,
  );

  Future<ApiResult<UpdateResponse>> updatePassword(String token, ChangePasswordBody body) async {
    try {
      UpdateResponse response;
      response = await apiServices.updatePasswordApi("Bearer $token", body);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

//function to update user info and send token in header
  Future<ApiResult<UpdateResponse>> updateUser(String token, UpdateRequestBody updateRequestBody,
      {File? image}) async {
    try {
      UpdateResponse response;

      if (image != null) {
        response = await apiServices.updateUserWithImage("Bearer $token", updateRequestBody, image);
      } else {
        response = await apiServices.updateUser(
          "Bearer $token",
          updateRequestBody,
        );
      }
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
