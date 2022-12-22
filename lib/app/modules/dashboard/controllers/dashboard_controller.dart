import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_care_pt2/app/modules/home/views/home_view.dart';
import 'package:health_care_pt2/app/modules/profile/views/profile_view.dart';
import 'package:health_care_pt2/app/modules/search/views/search_view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
