import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/core/networking/api_constants.dart';
import 'package:final_project/features/edit_profile/data/models/change_password_body.dart';
import 'package:final_project/features/edit_profile/data/models/update_request_body.dart';
import 'package:final_project/features/edit_profile/data/models/update_response.dart';
import 'package:final_project/features/favorite/data/model/myfavorites_response.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/login/data/models/login_request_body.dart';
import 'package:final_project/features/login/data/models/login_response.dart';
import 'package:final_project/features/search/data/model/city_response_model.dart';
import 'package:final_project/features/search/data/model/filter_model.dart';
import 'package:final_project/features/setting_screen/data/models/user_response.dart';
import 'package:final_project/features/signup/data/models/signup_request_body.dart';
import 'package:final_project/features/signup/data/models/signup_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @GET(ApiConstants.userInfo)
  Future<UserInfoResponse> getUser(
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.allPosts)
  Future<PropertiesModel> getAllPosts(
    @Header("Authorization") String token,
    @Query("page") int page,
    @Query("bathrooms") String? cityId,

  );

  @GET(ApiConstants.myAds)
  Future<HomePropertiesResponse> getMyAds(
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.myFavorites)
  Future<MyFavoritesResponse> getMyFavorites(
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.adminHome)
  Future<HomePropertiesResponse> getAdminHome(
    @Header("Authorization") String token,
  );


  @GET(ApiConstants.cities)
  Future<CityResponseModel> getCities(
      @Header("Authorization") String token,
      );

  @PATCH(ApiConstants.updatePassword)
  Future<UpdateResponse> updatePasswordApi(
    @Header("Authorization") String token,
    @Body() ChangePasswordBody body,
  );

  @MultiPart()
  @PATCH(ApiConstants.updateUser)
  Future<UpdateResponse> updateUserWithImage(
    @Header("Authorization") String token,
    @Part() UpdateRequestBody upadateRequestBody,
    @Part() File image,
  );

  @PATCH(ApiConstants.updateUser)
  Future<UpdateResponse> updateUser(
    @Header("Authorization") String token,
    @Body() UpdateRequestBody upadateRequestBody,
  );

  @PATCH("${ApiConstants.approveProperty}{propertyId}")
  Future<UpdateResponse> acceptProperty(
    @Header("Authorization") String token,
    @Path() String propertyId,
  );

  @POST("${ApiConstants.makeFavorite}{propertyId}")
  Future<UpdateResponse> makeFavorite(
    @Header("Authorization") String token,
    @Path() String propertyId,
  );

  @DELETE("${ApiConstants.makeFavorite}{propertyId}")
  Future<UpdateResponse> deleteFavorite(
    @Header("Authorization") String token,
    @Path() String propertyId,
  );

  @PATCH("${ApiConstants.rejectProperty}{propertyId}")
  Future<UpdateResponse> rejectProperty(
    @Header("Authorization") String token,
    @Path() String propertyId,
  );

  @POST(ApiConstants.addProperty)
  @MultiPart()
  Future<UpdateResponse> addProperty({
    @Part(name: "contract", contentType: "image/*") required File contract,
    @Part(name: "images", contentType: "image/*") required List<File> images,
    @Header("Authorization") required String token,
    @Part(name: 'name') required String name,
    @Part(name: 'level') required String level,
    @Part(name: 'city') required String city,
    @Part(name: 'area') required String area,
    @Part(name: 'address') required String address,
    @Part(name: 'description') required String description,
    @Part(name: 'bedrooms') required String bedrooms,
    @Part(name: 'bathrooms') required String bathrooms,
    @Part(name: 'price') required String price,
    @Part(name: 'approved') required String approved,
  });

  @POST(ApiConstants.addProperty)
  @MultiPart()
  Future<UpdateResponse> addPropertyWithPDF({
    @Part(name: "contract", contentType: "multipart/form-data")
    required File contract,
    @Part(name: "images", contentType: "image/*") required List<File> images,
    @Header("Authorization") required String token,
    @Part(name: 'name') required String name,
    @Part(name: 'level') required String level,
    @Part(name: 'city') required String city,
    @Part(name: 'area') required String area,
    @Part(name: 'address') required String address,
    @Part(name: 'description') required String description,
    @Part(name: 'bedrooms') required String bedrooms,
    @Part(name: 'bathrooms') required String bathrooms,
    @Part(name: 'price') required String price,
    @Part(name: 'approved') required String approved,
  });
}
