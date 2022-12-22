import 'package:flutter/material.dart';

class CardLayanan {
   String? nama;
   String? desc;
   Color? color;
   String? imgPath;


  CardLayanan({
     this.nama,
     this.desc,
     this.color,
     this.imgPath,
  });

   static List<CardLayanan> listLayanan = [
    CardLayanan(
      nama: "Layanan \nPerawat",
      desc:
          "Sebagai tenaga medis profesional, Perawat HealthCare memiliki kualifikasi yang dibutuhkan dalam menjalankan peran dan tugasnya. Adapun kualifikasi yang dimiliki oleh Perawat HealthCare di antaranya adalah lulus pendidikan tinggi keperawatan, memegang STR (Surat Tanda Registrasi), memiliki SIP (Surat Izin Praktik), hingga memiliki pengalaman sebagai perawat minimal tiga tahun lamanya. \n \nAdapun tugas dan peran yang diemban oleh seorang Perawat HealthCare yang memiliki kualifikasi di atas adalah sebagai berikut : \n\n-Menangani pasien yang sedang berkonsultasi. \n-Merekomendasikan obat sesuai resep dokter.",
      color: Color(0xff0ab885),
      imgPath: "assets/logo/perawat.png",
    ),
    CardLayanan(
      nama: "Layanan \nBidan",
      desc:
          "Sebagai tenaga medis profesional, Bidan HealthCare memiliki kualifikasi yang dibutuhkan dalam menjalankan peran dan tugasnya. Adapun kualifikasi yang dimiliki oleh Bidan HealthCare di antaranya adalah lulus pendidikan tinggi kebidanan, memegang STR (Surat Tanda Registrasi), memiliki SIP (Surat Izin Praktik), hingga memiliki pengalaman sebagai bidan minimal tiga tahun lamanya. \n \nAdapun tugas dan peran yang diemban oleh seorang Bidan HealthCare yang memiliki kualifikasi di atas adalah sebagai berikut : \n\n-Menangani pasien yang sedang berkonsultasi. \n-Merekomendasikan obat sesuai resep dokter.",
      color: Color(0xff0ab885),
      imgPath: "assets/logo/bidan.png",
    ),
  ];
}
