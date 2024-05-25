import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/core/networking/api_error_handler.dart';
import 'package:final_project/core/networking/api_result.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/features/add_post_screen/data/model/property_body_model.dart';
import 'package:final_project/features/edit_profile/data/models/update_response.dart';
import 'package:http_parser/http_parser.dart';

class AddPropertyRepo {
  final ApiServices apiServices;

  AddPropertyRepo(this.apiServices);

  Future<ApiResult<UpdateResponse>> addPropertyRepo(
    String token,
    PropertyBodyModel body,
    File contract,
    List<File> images,
  ) async {
    try {
      final multipartFiles = <MultipartFile>[];

      for (final file in images) {
        final fileBytes = await file.readAsBytes();
        final multipartFile = MultipartFile.fromBytes(
          fileBytes,
          filename: file.path.split('/').last,
          contentType: MediaType.parse("image/*"),
        );
        multipartFiles.add(multipartFile);
      }
      UpdateResponse response;
      response = await apiServices.addProperty(
          token: "Bearer $token",
          name: body.name,
          bathrooms: body.bathrooms,
          bedrooms: body.bedrooms,
          area: body.area,
          description: body.description,
          price: body.price,
          city: body.city,
          approved: body.approved,
          address: body.address,
          level: "1",
          // contract: "https://bayut-eg-production.s3.amazonaws.com/thumbnails/15921643-800x600.webp",
          // images: [
          //   "https://bayut-eg-production.s3.amazonaws.com/thumbnails/15921643-800x600.webp",
          //   "https://bayut-eg-production.s3.amazonaws.com/thumbnails/15921643-800x600.webp",
          // ]);
          contract: contract,
          images: images);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
