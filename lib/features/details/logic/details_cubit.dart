import 'package:bloc/bloc.dart';
import 'package:final_project/features/favorite/data/repo/my_favorites_repo.dart';

import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final MyFavoritesRepo _repo;

  DetailsCubit(this._repo) : super(const DetailsState.initial());

  Future<void> makeFavorite(String propId, bool fav) async {
    if (fav) {
      emit(const DetailsState.loading());
      final response = await _repo.makeFavorite(propId);

      response.when(success: (loginResponse) {
        emit(DetailsState.success(loginResponse));
      }, failure: (error) {
        emit(DetailsState.error(error: error.apiErrorModel.message ?? ''));
      });
    } else {
      emit(const DetailsState.loading());
      final response = await _repo.deleteFavorite(propId);

      response.when(success: (loginResponse) {
        emit(DetailsState.success(loginResponse));
      }, failure: (error) {
        emit(DetailsState.error(error: error.apiErrorModel.message ?? ''));
      });
    }
  }

  void deleteFavorite(String propId) {}
}
