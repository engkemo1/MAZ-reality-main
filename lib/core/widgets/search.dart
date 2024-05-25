import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List allCharacters = [];
List searchedForCharacters = [];
Widget buildSearchField(
  String hintText,
  TextEditingController searchTextController,
) {
  return TextField(
    style: TextStyle(color: const Color(0xFF8E8888), fontSize: 32.0.sp),
    controller: searchTextController,
    cursorColor: ColorsManager.darkGreen,
    keyboardType: TextInputType.text,
    autocorrect: true,
    decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 8.0.h),
        helperStyle: TextStyles.font25DarkGrayRegular,
        border: InputBorder.none,
        suffixIcon: const Icon(
          Icons.search,
          size: 24,
        )),
    onChanged: (searchedHome) {
      addSearchedForItemsToSearchedList(searchedHome);
    },
  );
}

void addSearchedForItemsToSearchedList(String searchedHome) {
  //searchedForCharacters = allCharacters.where((character) => character.toLowerCase().startsWith(searchedHome));
}
