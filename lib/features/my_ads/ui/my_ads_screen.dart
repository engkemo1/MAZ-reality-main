import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/my_ads/logic/my_ads_cubit.dart';
import 'package:final_project/features/my_ads/logic/my_ads_state.dart';
import 'package:final_project/features/my_ads/ui/widgets/my_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        appBar: AppBar(
          leadingWidth: 250.w,
          leading: Image.asset("assets/imgs/maz.png"),
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50.0.w),
              child: Text(
                "My Ads",
                style: TextStyles.font35BlackBold.copyWith(fontSize: 18.sp),
              ),
            ),
            Expanded(child: _Body()),
          ],
        ));
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAdsCubit>(
      create: (context) => getIt<MyAdsCubit>()..getMyAds(),
      child: BlocBuilder<MyAdsCubit, MyAdsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              final list = (data as HomePropertiesResponse).data?.properties ?? [];
              return SingleChildScrollView(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return MyAdWidget(property: list[index]);
                  },
                ),
              );
            },
            error: (error) => Center(
              child: Text(error),
            ),
          );
        },
      ),
    );
  }
}
