import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/helpers/searchable_app_dropdown_button.dart';
import 'package:final_project/core/helpers/utils.dart';
import 'package:final_project/features/cities/logic/cities_cubit.dart';
import 'package:final_project/features/cities/logic/cities_state.dart';
import 'package:final_project/features/search/data/model/city_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<City> AppCities = [];

class CitiesWidget extends StatelessWidget {
  final Function(String cityId) onCitySelected;

  const CitiesWidget({super.key, required this.onCitySelected});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CitiesCubit>(),
      child: _Body(onCitySelected: onCitySelected),
    );
  }
}

class _Body extends StatefulWidget {
  final Function(String cityId) onCitySelected;

  const _Body({required this.onCitySelected});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    context.read<CitiesCubit>().getCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          success: (data) {
            AppCities = (data as CityResponseModel).cities ?? [];

            return DropdownCustomWidget<City>(
              items: (data as CityResponseModel).cities ?? [],
              compareFn: (p0, p1) => p0 != p1,
              hintText: 'Select City',
              itemAsString: (p0) => p0.nameEn!,
              onChanged: (p0) {
                widget.onCitySelected(p0!.id!);
              },
              enabled: true,
              validate: (p0) {
                if (isNullOrEmpty(p0)) {
                  return "error";
                }
                return null;
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}
