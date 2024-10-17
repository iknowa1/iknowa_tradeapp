import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/imagepath.dart';

class IntroductionController extends GetxController {
  final pageController = PageController(viewportFraction: 1.0, keepPage: true);
  RxInt currentPage = 0.obs;
  Timer? timer;

  final List<String> images = [
    ImagePath.slider1, // Replace with your image paths
    ImagePath.slider2,
    ImagePath.slider3,
  ];

  final List<String> titlesYellow = [
    'Skill. Build. Prosper ',
    'Master. Create. Thrive',
    'Learn. Build. Succeed ',
  ];

  final List<String> titlesBlack = [
    'with iknowa',
    'with iknowa.',
    'with iknowa.',
  ];

  final List<String> descriptions = [
    'Develop your skills, build your future, and prosper with iknowa. Empowering you to grow and succeed in every step of your journey.',
    'Unlock your potential and bring your ideas to life with iknowa. Master your craft, create with purpose, and thrive in every endeavor.',
    'Unlock your potential with iknowa. Learn new skills, build innovative solutions, and succeed in your journey of growth!',
  ];

  List<Container> pages = [];


  @override
  void onInit() async {
    super.onInit();

    pages = List.generate(
        3,
            (index) => Container(
          width: double.maxFinite,
          child: Container(
              width: double.maxFinite,
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: double.maxFinite,
              )
          ),
        )
    );

    startAutoSlide();
  }

  void startAutoSlide() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {

      if (currentPage.value < 2) {
        currentPage.value++;
      } else {
        currentPage.value = 0; // Loop back to the first page
      }

      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
