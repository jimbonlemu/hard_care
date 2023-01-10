import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:lottie/lottie.dart';
import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';
import 'card_kesehatan.dart';

class IntroductionView extends GetView<IntroductionController> {
  final data = [
    CardKesehatanData(
      title: "Layanan Kami",
      subtitle:
          "Kami memberikan pelayanan yang dapat membantu anda untuk mengatasi keluhan penyakit yang sedang diderita.",
      image: AssetImage("assets/logo/health1.png"),
      backgroundColor: Color(0xffffffff),
      titleColor: Color(0xff0ab885),
      subtitleColor: Color.fromARGB(255, 0, 0, 0),
      background: LottieBuilder.asset("assets/lottie/bg-4.json"),
    ),
    CardKesehatanData(
      title: "Dirumah Saja",
      subtitle:
          "Sekarang anda dapat menyampaikan keluhan yang sedang anda alami kepada perawat atau bidan tanpa keluar rumah.",
      image: AssetImage("assets/logo/health4.png"),
      backgroundColor: Color(0xffD3F2E9),
      titleColor: Color.fromARGB(255, 0, 0, 0),
      subtitleColor: Color.fromARGB(255, 0, 0, 0),
      background: LottieBuilder.asset("assets/lottie/bg-2.json"),
    ),
    CardKesehatanData(
      title: "Lebih Mudah",
      subtitle:
          "Terdapat fitur chat yang dapat memudahkan anda dalam melakukan konsultasi secara online kepada perawat atau bidan.",
      image: AssetImage("assets/logo/health2.png"),
      backgroundColor: Color(0xff0ab885),
      titleColor: Color(0xffffffff),
      subtitleColor: Color(0xffffffff),
      background: LottieBuilder.asset("assets/lottie/bg-5.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
          colors: data.map((e) => e.backgroundColor).toList(),
          itemCount: data.length,
          itemBuilder: (int index) {
            return CardKesehatan(data: data[index]);
          },
          onFinish: () => Get.offAllNamed(Routes.LOGIN)),
    );
  }
}
