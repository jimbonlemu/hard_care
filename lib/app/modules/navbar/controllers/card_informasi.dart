import 'package:flutter/material.dart';

class CardInformasi {
  final String poli;
  final String nama;
  final String deskripsi;
  final String faq;
  final Color color;
  final String imgPath;
  final String imgBg;

  CardInformasi({
   required this.poli,
   required this.nama,
   required this.deskripsi,
   required this.faq,
   required this.color,
   required this.imgPath,
   required this.imgBg,
  });

  static List<CardInformasi> listInformasi = [
    CardInformasi(
      poli: "Kandungan",
      nama: "Poliklinik Kandungan",
      deskripsi:
          "Poliklinik  kandungan adalah klinik yang memberikan pelayanan pemeriksaan kehamilan, penyakit kandungan dan persalinan. Sarana penunjang yang juga kami sediakan untuk mendukung klinik kebidanan dan kandungan ini adalah fasilitas USG untuk mengetahui perkembangan janin pada si ibu hamil.",
      faq: "lorem",
      color: Color(0xff0ab885),
      imgPath: "assets/logo/pregnant.png",
      imgBg: "assets/logo/bg_pregnant.jpg",
    ),
    CardInformasi(
      poli: "Gigi",
      nama: "Poliklinik Gigi",
      deskripsi:
          "Poliklink gigi adalah klink yang memberikan pelayanan kesehatan gigi dan mulut berupa pemeriksaan kesehatan gigi dan mulut, pengobatan dan pemberian tindakan medis kesehatan gigi dan mulut seperti penambalan gigi, pencabutan gigi dan pembersihan karang gigi, juga melayani tindakan medis spesialistik tingkat pertama seperti perawatan saluran akar pada gigi anterior atau gigi satu saluran akar.",
      faq:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      color: Color(0xff4B7FFB),
      imgPath: "assets/logo/dental_surgeon.png",
      imgBg: "assets/logo/gigi.png",
    ),
    CardInformasi(
      poli: "Jantung",
      nama: "Poliklinik Jantung & Pembuluh Darah",
      deskripsi:
          "Poliklinik jantung dan pembuluh darah adalah klink yang menangani hal-hal yang berkaitan dengan jantung dan pembuluh darah, atau kardiovaskuler, Orang biasanya akan datang ke Poliklinik Jantung & Pembuluh darah, karena berkaitan dengan pencegahan, diagnosis, dan pengobatan berbagai penyakit kardiovaskular, mulai dari tekanan darah tinggi hingga serangan jantung. ",
      faq: "lorem",
      color: Color(0xffEF716B),
      imgPath: "assets/logo/heart_surgeon.png",
      imgBg: "",
    ),
    CardInformasi(
      poli: "Mata",
      nama: "Poliklinik Mata",
      deskripsi:
          "Poliklinik mata adalah klinik yang memberikan pemeriksaan, perawatan, serta diagnosis yang berhubungan dengan penyakit mata dan gangguan penglihatan.",
      faq: "lorem",
      color: Color(0xffFFB167),
      imgPath: "assets/logo/eye_specialist.png",
      imgBg: "",
    ),
  ];
}
