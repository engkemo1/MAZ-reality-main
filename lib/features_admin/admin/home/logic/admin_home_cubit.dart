import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/admin_home_repo.dart';
import 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  final AdminHomeRepo _homeRepo;

  AdminHomeCubit(this._homeRepo) : super(const AdminHomeState.initial());

  void getPendingProperties(int page) async {
    emit(const AdminHomeState.loading());
    final response = await _homeRepo.getAdminPendingPosts(page);

    response.when(success: (data) {
      emit(AdminHomeState.success(data));
    }, failure: (error) {
      emit(AdminHomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
