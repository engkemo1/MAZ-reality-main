import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperController extends GetxController {
  late PageController pageController;

  //variable for changing index of Bottom AppBar
  RxInt currentIndex = 0.obs;




  void goToPage(int page){
    currentIndex.value = page;
    pageController.jumpToPage(page);
  }   


  void animateToPage(int page){
    currentIndex.value = page;
    pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
