import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hapus_akun_controller.dart';

class HapusAkunView extends GetView<HapusAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color(0xff0ab885),
      title: Text('Hapus Akun'),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    ));
  }
}
