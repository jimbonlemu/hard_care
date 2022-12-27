import 'dart:async';

import 'package:get/get.dart';

import '../../../data/models/api/jadwal_api.dart';
import '../../../data/models/jadwal_model.dart';

class JadwalController extends GetxController with StateMixin {
  List<JadwalApi> listJadwal = <JadwalApi>[].obs;
  Rx<RepoJadwal> jadwalRepo = RepoJadwal().obs;

  getData() async {
    // print(await RepoJadwal().getData());
    // for (var item in await RepoJadwal().getData()) {
    //   listJadwal.add(item);
    // }
    change(null, status: RxStatus.loading()); 
    listJadwal = await RepoJadwal().getData();
    change(null, status: RxStatus.success());
    print(listJadwal.length);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
  }
}
