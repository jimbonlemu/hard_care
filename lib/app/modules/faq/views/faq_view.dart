import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  @override
  Widget build(BuildContext context) {
    print(["cek faq", controller.listFaq.length]);
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xff0ab885),
        title: Text('FAQ'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 25,
          ),
          child: controller.obx(
            (state) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.listFaq.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Accordion(
                        disableScrolling: true,
                        maxOpenSections: 2,
                        headerPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        headerBackgroundColor: Color(0xff0ab885),
                        paddingListTop: 0,
                        paddingListBottom: 0,
                        children: [
                          AccordionSection(
                            contentBorderColor: Color(0xff0ab885),
                            headerBackgroundColor: Color(0xff0ab885),
                            isOpen: false,
                            header: Text(
                              controller.listFaq[index].pertanyaan,
                              style: TextStyle(
                                  color: Color(0xffF9F9F9), fontSize: 15),
                            ),
                            content: Text(controller.listFaq[index].jawaban),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
