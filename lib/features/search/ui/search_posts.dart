import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/cities/ui/cities_widget.dart';
import 'package:final_project/features/details/ui/details_screen.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/home_details/logic/home_state.dart';
import 'package:final_project/features/home_details/ui/widgets/property_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPosts extends StatelessWidget {
  final dynamic properties;

  const SearchPosts({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return _PostsBody(properties: properties);
  }
}

class _PostsBody extends StatefulWidget {
  final dynamic properties;

  const _PostsBody({required this.properties});

  @override
  State<_PostsBody> createState() => _PostsState();
}

class _PostsState extends State<_PostsBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

      ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.properties.length,
      itemBuilder: (context, index) =>
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(
                  top: 8.h),
              child: InkWell(
                  onTap: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) =>
                          DetailsScreen(property: widget.properties[index],
                            isFilter: true,))),
                  child: SizedBox(
                  width: 1.sw,
                  child: PropertyItemWidget(
                      property: widget.properties[index]))),
    ),)
    ,
    ]
    ,
    );
  }
}
