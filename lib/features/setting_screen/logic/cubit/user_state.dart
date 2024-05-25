part of 'user_cubit.dart';

@immutable
abstract class UserState {}
class UserInitial extends UserState {}
class GetUserDetails extends UserState {
  final UserInfoResponse userInfoResponse;
  GetUserDetails(this.userInfoResponse);
}
