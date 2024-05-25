import 'package:bloc/bloc.dart';
import 'package:final_project/core/helpers/shared_pres.dart';

import '../data/repo/approve_property_repo.dart';
import 'approve_property_state.dart';

class ApprovePropertyCubit extends Cubit<ApprovePropertyState> {
  final ApprovePropertyRepo _propertyRepo;

  ApprovePropertyCubit(this._propertyRepo)
      : super(const ApprovePropertyState.initial());

  void acceptProperty(String property) async {
    emit(const ApprovePropertyState.loading());
    String token = await SharedPres.getToken() ?? '';
    final response = await _propertyRepo.acceptProperty(token, property);

    response.when(success: (loginResponse) {
      emit(ApprovePropertyState.successApproved(loginResponse));
    }, failure: (error) {
      emit(
          ApprovePropertyState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void rejectProperty(String property) async {
    emit(const ApprovePropertyState.loading());
    String token = await SharedPres.getToken() ?? '';
    final response = await _propertyRepo.rejectProperty(token, property);

    response.when(success: (loginResponse) {
      emit(ApprovePropertyState.successReject(loginResponse));
    }, failure: (error) {
      emit(
          ApprovePropertyState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
