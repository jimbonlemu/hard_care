import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jadwal_controller.dart';

class JadwalView extends GetView<JadwalController> {
  @override
  Widget build(BuildContext context) {
    print(['view', controller.listJadwal.length]);
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Jadwal",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            controller.obx(
              (state) {
                print(['view', controller.listJadwal.length]);
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.listJadwal.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xff4B7FFB).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: ListTile(
                            leading: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Color(0xff4B7FFB).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.6),
                                  ),
                                ],
                              ),
                            ),
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.listJadwal[index].nama,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Buka  : "),
                                    Text(
                                      controller.listJadwal[index].jadwal_mulai,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Tutup : "),
                                    Text(
                                      controller
                                          .listJadwal[index].jadwal_selesai,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              onLoading: Center(
                child: CircularProgressIndicator(
                  color: Color(0xff0ab885),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
