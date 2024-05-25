import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/my_favorites_repo.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<MyFavoritesState> {
  final MyFavoritesRepo _favoritesRepo;

  FavoritesCubit(this._favoritesRepo) : super(const MyFavoritesState.initial());

  void getFavorites() async {
    emit(const MyFavoritesState.loading());
    final response = await _favoritesRepo.getMyFavorites();

    response.when(success: (data) {
      emit(MyFavoritesState.success(data));
    }, failure: (error) {
      emit(MyFavoritesState.error(error: error.apiErrorModel.message ?? ''));
    });
  }


}
