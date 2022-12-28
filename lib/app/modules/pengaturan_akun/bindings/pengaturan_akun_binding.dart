import 'package:get/get.dart';

import '../controllers/pengaturan_akun_controller.dart';

class PengaturanAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaturanAkunController>(
      () => PengaturanAkunController(),
    );
  }
}
