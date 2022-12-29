import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care_pt2/app/routes/app_pages.dart';

import '../controllers/pengaturan_akun_controller.dart';

class PengaturanAkunView extends GetView<PengaturanAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Akun'),
        backgroundColor: Color(0xff0ab885),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 450,
              height: 75,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.UBAH_PASSWORD);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff0ab885),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Ubah Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffF9F9F9),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 450,
              height: 75,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.HAPUS_AKUN);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffFA645D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Hapus akun',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffF9F9F9),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
