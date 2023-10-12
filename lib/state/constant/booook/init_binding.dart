import 'package:booook/state/auth/auth_getx.dart';
import 'package:booook/state/constant/booook/booook_getx.dart';
import 'package:booook/state/home/main_getx.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthGetx());
    Get.put(BooookGetx()..booookAppVesionCheck());
    Get.put(MainGetx());
  }
}