import 'package:booook/state/auth/auth_getx.dart';
import 'package:booook/state/constant/booook/booook_getx.dart';
import 'package:booook/ui/auth/signup/signup_name.dart';
import 'package:booook/ui/main/boook_main.dart';
import 'package:booook/ui/splash/booook_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BoookApp extends StatelessWidget {
  const BoookApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GetBuilder<BooookGetx>(
      builder: (booook) {
        if (booook.isVersionChecking) {
          // splash screen
          return const SplashScreen();
        } else {
          return GetBuilder<AuthGetx>(builder: (x) {
            if(x.isSplash) {
              return const SplashScreen();
            } else {
              if(x.isGoToMain) {
                return const BoookMain();
              } else {
                return const SignUpName();
              }
            }
          });
        }
      },

    );
  }
}