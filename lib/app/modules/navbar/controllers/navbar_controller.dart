import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import 'card_informasi.dart';
import 'card_layanan.dart';

class NavbarController extends GetxController {
  List<CardInformasi> cardInformasi = CardInformasi.listInformasi;
  List<CardLayanan> cardLayanan = CardLayanan.listLayanan;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class FlutterIcons {
  FlutterIcons._();

  static const _kFontFam = 'FlutterIcons';
  static const _kFontPkg = null;

  static const IconData add = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData list = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bag = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData compass = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData person_outline = IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData converse = IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search = IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData nike = IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData left_open_1 = IconData(0xf007, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
