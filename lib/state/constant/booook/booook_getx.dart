import 'package:booook/state/auth/auth_getx.dart';
import 'package:get/get.dart';

class BooookGetx extends GetxController {
  static BooookGetx get to => Get.find();
  bool isVersionChecking = false;

  Future booookAppVesionCheck() async {
    isVersionChecking = true;
    update();
    Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () {
        isVersionChecking = false;
        update();
      },
    );
    await AuthGetx.to.autoSignInNameCheck();
  }
}