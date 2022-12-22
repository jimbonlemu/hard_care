import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_care_pt2/app/modules/navbar/controllers/navbar_controller.dart';

import '../controllers/card_informasi.dart';

class DetailInformationView extends GetView<NavbarController> {
  final CardInformasi cardInformasi;

  DetailInformationView(this.cardInformasi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardInformasi.color,
      appBar: AppBar(
        backgroundColor: cardInformasi.color,
        elevation: 0,
        title: Text('Informasi ${cardInformasi.poli}'),
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${cardInformasi.nama}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${cardInformasi.deskripsi}",
                          style: TextStyle(
                            height: 1.6,
                            color:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
