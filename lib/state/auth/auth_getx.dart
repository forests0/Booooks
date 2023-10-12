import 'package:booook/state/home/main_getx.dart';
import 'package:booook/ui/main/boook_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGetx extends GetxController {
  static AuthGetx get to => Get.find();
  bool isSplash = true;
  bool isGoToMain = false;

  TextEditingController nameController = TextEditingController();
  RxString name = ''.obs;

  Future autoSignInNameCheck() async {
    Future.delayed(
      const Duration(
        milliseconds: 2000,
      ),
      () async {
        SharedPreferences? pref = await SharedPreferences.getInstance();
        if (pref.getString('name') != null) {
          isGoToMain = true;
          name(pref.getString('name'));
          await MainGetx.to.getBookListData();
        }
        isSplash = false;
        update();
      },
    );
  }

  void changedName({
    required String text,
  }) {
    name(text);
  }

  Future signUpName() async {
    if (name.value.isNotEmpty) {
      SharedPreferences? pref = await SharedPreferences.getInstance();
      await pref.setString('name', name.value).then((value) async {
        await MainGetx.to.getBookListData();
        Get.offAll(() => const BoookMain());
      });
    }
  }
}