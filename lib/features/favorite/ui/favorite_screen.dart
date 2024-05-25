import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/details/logic/details_cubit.dart';
import 'package:final_project/features/favorite/logic/favorites_cubit.dart';
import 'package:final_project/features/favorite/logic/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/myfavorites_response.dart';
import 'widgets/my_favorite_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                "Favorite",
                style: TextStyles.font35BlackBold.copyWith(fontSize: 18.sp),
              ),
            ),
            Expanded(
                child: BlocProvider(
                    create: (_) => getIt<FavoritesCubit>(), child: _Body())),
          ],
        ));
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    context.read<FavoritesCubit>().getFavorites();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, MyFavoritesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) {
            final list = (data as MyFavoritesResponse).data!.favorites!;
            return Wrap(
                // itemCount: list.length,
                // padding: EdgeInsets.symmetric(horizontal: 16.w),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 10.w,
                //   mainAxisSpacing: 16.w,
                // ),
                // itemBuilder: (context, index) {
                children: list
                    .map((e) => MyFavoriteWidget(
                          property: e.property!,
                          onDelete: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Removed From Favorites"),
                              backgroundColor: Colors.red,
                            ));

                            context
                                .read<DetailsCubit>()
                                .makeFavorite(e.id!, false);
                            Future.delayed(const Duration(seconds: 1), () {
                              context.read<FavoritesCubit>().getFavorites();
                            });
                          },
                        ))
                    .toList());
          },
          error: (error) => Center(
            child: Text(error),
          ),
        );
      },
    );
  }
}
