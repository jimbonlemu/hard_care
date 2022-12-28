import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hapus_akun_controller.dart';

class HapusAkunView extends GetView<HapusAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HapusAkunView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HapusAkunView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
