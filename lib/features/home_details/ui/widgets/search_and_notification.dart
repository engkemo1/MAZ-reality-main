import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/styles.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndNotification extends StatefulWidget {
  const SearchAndNotification({super.key});

  @override
  State<SearchAndNotification> createState() => _SearchAndNotificationState();
}

class _SearchAndNotificationState extends State<SearchAndNotification> {
  bool isSearch = false;
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            "assets/imgs/maz.png",
            width: 80.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ]),
        Padding(
          padding: EdgeInsets.only(top: 2.0.h),
          child: InkWell(
            onTap: () {
              context.pushNamed(Routes.searchScreen);
            },
            child: Container(
                  width: .9.sw,
                  height: 28.h,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70.r),
                  color: const Color.fromARGB(255, 212, 208, 208)),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical:3.h),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 16.w,),
                       Text("Search home here",style: TextStyles.font25DarkGrayRegular,),
                      // SizedBox(width: 16.w,),
                      const Icon(Icons.search, size: 24, color: Colors.black,)
                    ],
                  ),
            )
          ),
        )
      ],
    );
  }
}


// Container(
//               width: 850.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(70.sp),
//                   color: const Color.fromARGB(255, 185, 185, 185)),
//               child: TextFormField(
                
//                 style: TextStyle(
//                     color: const Color.fromARGB(255, 255, 253, 253), fontSize: 32.0.sp),
//                 cursorColor: Colors.white,
//                 keyboardType: TextInputType.text,
                    
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 13.0.w, vertical: 8.0.h),
//                     hintText: "         Search home here",
//                     helperStyle: TextStyles.font25DarkGrayRegular,
//                     border: InputBorder.none,
//                     suffixIcon: const Icon(
//                       Icons.search,
//                       size: 24,
//                     )),
//               ),
//             ),