import 'package:bloc/bloc.dart';
import 'package:final_project/features/setting_screen/data/models/user_response.dart';
import 'package:final_project/features/setting_screen/data/repos/user_repo.dart';
import 'package:final_project/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;
  UserCubit(this.userRepo) : super(UserInitial());

  void emitGetUserDetails(String token) async {
    userRepo.getUser(token).then((userDetails) {
      USER_DATA = userDetails;
      emit(GetUserDetails(userDetails));
    });
  }
}
