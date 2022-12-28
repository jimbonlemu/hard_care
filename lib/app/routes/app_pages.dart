import 'package:get/get.dart';

import 'package:health_care_pt2/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:health_care_pt2/app/modules/dashboard/views/dashboard_view.dart';
import 'package:health_care_pt2/app/modules/faq/bindings/faq_binding.dart';
import 'package:health_care_pt2/app/modules/faq/views/faq_view.dart';
import 'package:health_care_pt2/app/modules/hapus_akun/bindings/hapus_akun_binding.dart';
import 'package:health_care_pt2/app/modules/hapus_akun/views/hapus_akun_view.dart';
import 'package:health_care_pt2/app/modules/jadwal/bindings/jadwal_binding.dart';
import 'package:health_care_pt2/app/modules/jadwal/views/jadwal_view.dart';
import 'package:health_care_pt2/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:health_care_pt2/app/modules/navbar/views/navbar_view.dart';
import 'package:health_care_pt2/app/modules/pengaturan_akun/bindings/pengaturan_akun_binding.dart';
import 'package:health_care_pt2/app/modules/pengaturan_akun/views/pengaturan_akun_view.dart';
import 'package:health_care_pt2/app/modules/register/bindings/register_binding.dart';
import 'package:health_care_pt2/app/modules/register/views/register_view.dart';
import 'package:health_care_pt2/app/modules/ubah_password/bindings/ubah_password_binding.dart';
import 'package:health_care_pt2/app/modules/ubah_password/views/ubah_password_view.dart';

import '../modules/change_profile/bindings/change_profile_binding.dart';
import '../modules/change_profile/views/change_profile_view.dart';
import '../modules/chat_room/bindings/chat_room_binding.dart';
import '../modules/chat_room/views/chat_room_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/update_status/bindings/update_status_binding.dart';
import '../modules/update_status/views/update_status_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_STATUS,
      page: () => UpdateStatusView(),
      binding: UpdateStatusBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PROFILE,
      page: () => ChangeProfileView(),
      binding: ChangeProfileBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN_AKUN,
      page: () => PengaturanAkunView(),
      binding: PengaturanAkunBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_PASSWORD,
      page: () => UbahPasswordView(),
      binding: UbahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.HAPUS_AKUN,
      page: () => HapusAkunView(),
      binding: HapusAkunBinding(),
    ),
  ];
}
