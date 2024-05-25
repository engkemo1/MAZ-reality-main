import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/signup/data/models/signup_request_body.dart';
import 'package:final_project/features/signup/data/models/signup_response.dart';
import 'package:final_project/core/helpers/shared_pres.dart';

class SignupRepo {
  final ApiServices _apiServices;

  SignupRepo(this._apiServices);
  
  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiServices.signup(signupRequestBody);
      SharedPres.saveToken("${response.token}");
      SharedPres.saveUserId(response.data!.user!.id.toString());

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
 }
