import 'package:get/get.dart';
import 'package:health_care_pt2/app/modules/navbar/controllers/card_informasi.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
  }
}
