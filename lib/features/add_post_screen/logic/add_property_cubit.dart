import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/features/add_post_screen/data/model/property_body_model.dart';
import 'package:final_project/features/add_post_screen/data/repo/add_property_repo.dart';
import 'package:flutter/material.dart';

import 'add_property_state.dart';

class AddPropertyCubit extends Cubit<AddPropertyState> {

  AddPropertyCubit(this._propertyRepo) : super(const AddPropertyState.initial());

  final AddPropertyRepo _propertyRepo;

  TextEditingController area = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController bedrooms = TextEditingController();
  TextEditingController bathrooms = TextEditingController();
  TextEditingController address = TextEditingController();
  String cityId = '';

  final formKey = GlobalKey<FormState>();

  void addProperty({required File contract, required List<File> images}) async {
    emit(const AddPropertyState.loading());
    String token = await SharedPres.getToken() ?? '';
    final response = await _propertyRepo.addPropertyRepo(
      token,
      PropertyBodyModel(
        city: cityId.isNotEmpty ?  cityId : "6603cdb48cc36a22dc4eb012",
        approved: 'false',
        address: address.text,
        bathrooms: bathrooms.text,
        bedrooms: bedrooms.text,
        price: price.text,
        description: description.text,
        name: name.text,
        area: area.text,
      ),
      contract,
      images,
    );

    response.when(success: (loginResponse) {
      emit(AddPropertyState.success(loginResponse));
    }, failure: (error) {
      emit(AddPropertyState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void onChangeCity(String cityId) {
    this.cityId = cityId;
  }
}
