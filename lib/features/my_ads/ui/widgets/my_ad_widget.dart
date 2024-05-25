import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAdWidget extends StatelessWidget {
  const MyAdWidget({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.detailsScreen, arguments: property),
      child: Container(
        width: .5.sw,
        height: 180.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: CachedNetworkImage(
                imageUrl: property.images!.first.startsWith("http")
                    ? property.images!.first
                    : "https://mazrealty.onrender.com/img/properties/${property.images!.first}",
                width: 1.sw,
                height: 180.h,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) {
                  return Image.asset("assets/imgs/maz.png");
                },
              ),
            ),
            Positioned.fill(
              top: 16,
              right: 8,
              left: 8,
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  height: 26.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/imgs/marker.png",
                        width: 16.w,
                        height: 16.h,
                      ),
                      Text(
                        "${property.area!}Km",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 16,
              left: 16,
              right: 16,
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.name!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        property.address!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
