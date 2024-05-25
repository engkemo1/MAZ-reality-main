import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/login/data/models/login_request_body.dart';
import 'package:final_project/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiServices _apiServices;
  LoginRepo(
    this._apiServices,
  );

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiServices.login(loginRequestBody);
      SharedPres.saveToken("${response.token}");
      SharedPres.saveUserId(response.data!.user!.id.toString());
      SharedPres.saveRole("${response.data!.user!.role}");
  
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
