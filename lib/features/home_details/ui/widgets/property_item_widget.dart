import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../data/models/home_properties_response.dart';

class PropertyItemWidget extends StatelessWidget {
  final dynamic property;

  const PropertyItemWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: CachedNetworkImage(
            imageUrl: property.images.isEmpty
                ? "https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
                : property.images!.first,
            errorListener: (v) {
              return;
            },
            width: 1.sw,
            height: 140.h,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Image.asset(
              "assets/imgs/maz.png",
              height: 140.h,
            ),
          ),
        ),
        Gap(8.h),
        SizedBox(
          width: 1.sw,
          child: Text(
            "\$${property.price}/month",
            style: TextStyle(
              color: ColorsManager.darkBrown,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Gap(4.h),
        SizedBox(
          width: 1.sw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: .8.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${property.name}",
                          style: TextStyle(
                            color: ColorsManager.darkBlue,
                            fontSize: 17.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        if (!property.approved!)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: ColorsManager.darkBlue,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: const Text(
                              "Pending",
                              style: TextStyle(
                                color: ColorsManager.lightBrown,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/imgs/map.png",
                        width: 16.sp,
                        height: 16.sp,
                      ),
                      Text(
                        property.address!,
                        style: TextStyle(
                          color: ColorsManager.gray,
                          fontSize: 13.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
        Gap(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PropertyPropertyValue(
              image: "assets/imgs/bedroom.png",
              value: "${property.bedrooms!}Beds",
            ),
            PropertyPropertyValue(
              image: "assets/imgs/pathroom.png",
              value: "${property.bathrooms!}Paths",
            ),
            PropertyPropertyValue(
              image: "assets/imgs/parking.png",
              value: "${property.bedrooms!}Parking",
            ),
            PropertyPropertyValue(
              image: "assets/imgs/space.png",
              value: "${property.area!}sqft",
            ),
          ],
        ),
        SizedBox(height: 8.h)
      ],
    );
  }
}

class PropertyPropertyValue extends StatelessWidget {
  final String image, value;

  const PropertyPropertyValue(
      {super.key, required this.image, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 14.sp,
          height: 14.sp,
        ),
        SizedBox(width: 2.w),
        SizedBox(
          height: 24.h,
          child: VerticalDivider(color: ColorsManager.darkBlue, width: 2.w),
        ),
        SizedBox(width: 2.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
