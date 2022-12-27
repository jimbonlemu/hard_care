import 'package:get/get.dart';
import 'package:health_care_pt2/app/data/models/api/faq_api.dart';
import 'package:health_care_pt2/app/data/models/faq_model.dart';

class FaqController extends GetxController with StateMixin {
  List<Faq> listFaq = <Faq>[].obs;
  Rx<RepoFAQ> jadwalFaq = RepoFAQ().obs;

  getDataFaq() async {
    change(null, status: RxStatus.loading());
    listFaq = await RepoFAQ().getData();
    change(null, status: RxStatus.success());
    print(["INI DI CONTROLLER", listFaq.length]);
  }

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
