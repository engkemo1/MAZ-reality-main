import 'dart:io';

import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/features/edit_profile/data/models/change_password_body.dart';
import 'package:final_project/features/edit_profile/data/models/update_request_body.dart';
import 'package:final_project/features/edit_profile/logic/update_profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/update_repo.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateRepo _profileRepo;

  UpdateProfileCubit(this._profileRepo) : super(const UpdateProfileState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void updateProfile(UpdateRequestBody updateRequestBody, {File? image}) async {
    emit(const UpdateProfileState.loading());
    String token = await SharedPres.getToken() ?? '';
    final response = await _profileRepo.updateUser(token, updateRequestBody, image: image);

    response.when(success: (loginResponse) {
      emit(UpdateProfileState.success(loginResponse));
    }, failure: (error) {
      emit(UpdateProfileState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void updatePassword(ChangePasswordBody body) async {
    emit(const UpdateProfileState.loading());
    String token = await SharedPres.getToken() ?? '';
    final response = await _profileRepo.updatePassword(token, body);

    response.when(success: (loginResponse) {
      emit(UpdateProfileState.success(loginResponse));
    }, failure: (error) {
      emit(UpdateProfileState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
