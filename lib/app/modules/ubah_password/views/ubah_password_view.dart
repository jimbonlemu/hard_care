import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UbahPasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UbahPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
