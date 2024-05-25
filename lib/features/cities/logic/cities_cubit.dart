import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/favorite/data/model/myfavorites_response.dart';

import '../data/repo/cities_repo.dart';
import 'cities_state.dart';


class CitiesCubit extends Cubit<CitiesState> {
  final CitiesRepo _repo;
  CitiesCubit(this._repo) : super(const CitiesState.initial());

  void getCities() async {
    emit(const CitiesState.loading());
    final response = await _repo.getCities();

    response.when(success: (data) {
      emit(CitiesState.success(data));
    }, failure: (error) {
      emit(CitiesState.error(error: error.apiErrorModel.message ?? ''));
    });
    
  }
  
  Future getListOfCities()async{
    List<City> cities=[];
   Response response = await Dio().get("https://mazrealty-live.onrender.com/api/v1/cities",);
   if(response.statusCode==200){
     cities=(response.data["data"]["cities"] as List).map((e)=>City.fromJson(e)).toList();
   }
   return cities;
  }

}
