import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/home_details/logic/home_state.dart';
import 'package:final_project/features/home_details/ui/widgets/property_item_widget.dart';
import 'package:final_project/features/search/data/model/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../details/ui/details_screen.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: const _PostsBody(),
    );
  }
}

class _PostsBody extends StatefulWidget {
  const _PostsBody();

  @override
  State<_PostsBody> createState() => _PostsState();
}

class _PostsState extends State<_PostsBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllPosts(1);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Near from you",
              style: TextStyles.font35BlackBold.copyWith(fontWeight: FontWeightHelper.regular),
            ),
            SizedBox(
              width: 9.w,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "See more",
                  style: TextStyles.font29GrayRegular.copyWith(fontSize: 14.sp),
                )),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        //   InkWell(
        //     onTap: () {
        //       context.pushNamed(Routes.detailsScreen);
        //     },
        //     child: Container(
        //       width: 430.w,
        //       height: 120.h,
        //       decoration: BoxDecoration(
        //         color: Colors.red,
        //         borderRadius: BorderRadius.circular(30.r),
        //       ),
        //     ),
        //   )
        BlocConsumer<HomeCubit, HomeState>(
            listener: (BuildContext context, state) {},
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const CircularProgressIndicator(),
                success: (data) {
                  final list = (data as PropertiesModel).data!.data!;
                  print("//////////////");
print(list.length);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 8.h),
                      child: InkWell(
                          onTap: () =>    Navigator.push(context, MaterialPageRoute(builder: (_) =>
                              DetailsScreen(property: list[index],
                                isFilter: false,))),
                          child: SizedBox(
                              width: 1.sw,
                              child: PropertyItemWidget(property: list[index]))),
                    ),
                  );
                },
                error: (e) => const SizedBox.shrink(),
              );
            })
      ],
    );
  }
}
