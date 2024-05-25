import 'package:final_project/features/signup/data/models/signup_request_body.dart';
import 'package:final_project/features/signup/data/repos/signup_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupState() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text));

    response.when(success: (signupResonse) {
      emit(SignupState.signupSuccess(signupResonse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
