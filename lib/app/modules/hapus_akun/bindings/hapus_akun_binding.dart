import 'package:get/get.dart';

import '../controllers/hapus_akun_controller.dart';

class HapusAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HapusAkunController>(
      () => HapusAkunController(),
    );
  }
}
