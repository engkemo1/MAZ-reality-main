import 'package:bloc/bloc.dart';

import '../data/repo/my_ads_repo.dart';
import 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit(this._homeRepo) : super(const MyAdsState.initial());

  final MyAdsRepo _homeRepo;

  void getMyAds() async {
    emit(const MyAdsState.loading());
    final response = await _homeRepo.getMyAds();

    response.when(success: (data) {
      emit(MyAdsState.success(data));
    }, failure: (error) {
      emit(MyAdsState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
