import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care_pt2/app/modules/navbar/controllers/navbar_controller.dart';

import '../controllers/app_clipper.dart';
import '../controllers/card_layanan.dart';

class DetailServicesView extends GetView<NavbarController> {
  final CardLayanan cardLayanan;

  DetailServicesView(this.cardLayanan);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardLayanan.color,
      appBar: AppBar(
        backgroundColor: cardLayanan.color,
        elevation: 0,
        title: Text('Layanan Kami'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Image(
                image: AssetImage('assets/logo/bg_shape.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1, left: 200),
              child: Hero(
                tag: "hero ${cardLayanan.imgPath}",
                child: Image(
                  width: MediaQuery.of(context).size.width * .45,
                  image: AssetImage("${cardLayanan.imgPath}"),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: 50,
                    diagonalHeight: 180,
                    roundedBottom: false,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 110, left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            "${cardLayanan.nama}",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${cardLayanan.desc}",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        )
                      ],
                    ),
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
