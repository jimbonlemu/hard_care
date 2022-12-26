import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care_pt2/app/controllers/auth_controller.dart';
import 'package:health_care_pt2/app/modules/navbar/views/detail_information_view.dart';
import 'package:health_care_pt2/app/modules/navbar/views/detail_services_view.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print(authC.pasienModel.value.nama);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
            ),
            Obx(() => Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 2),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hai, ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: '${authC.pasienModel.value.nama}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Temukan Perawat\nyang Anda Inginkan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Informasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 135,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: controller.cardInformasi.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(() => DetailInformationView(
                            controller.cardInformasi[index]));
                      },
                      child: _buildInformasi(index));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Layanan Kami',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.cardLayanan.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          DetailServicesView(controller.cardLayanan[index]));
                    },
                    child: _buildLayanan(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayanan(int index) {
    return Container(
      height: 150,
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xff0ab885).withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Text(
              controller.cardLayanan[index].nama.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80, top: 8),
            child: Image.asset('assets/logo/bg_shape.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: 160, top: 10),
            child: Hero(
              tag: "hero${controller.cardLayanan[index].imgPath}",
              child: Image.asset(
                controller.cardLayanan[index].imgPath.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformasi(int index) {
    return Container(
      width: 130,
      height: 150,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 105,
              height: 125,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  controller.cardInformasi[index].poli.toString(),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: controller.cardInformasi[index].color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                controller.cardInformasi[index].imgPath.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
