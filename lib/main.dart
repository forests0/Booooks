import 'package:booook/state/constant/booook/init_binding.dart';
import 'package:booook/ui/constant/theme/app_scroll_behavior.dart';
import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Booook());
}

class Booook extends StatelessWidget {
  const Booook({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return ScrollConfiguration(
          behavior: appScrollBehavior(),
           child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const SizedBox(),
            )
           );
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
        fontFamily: 'SpoqaHanSansNeoR',
        primaryColor: Colors.white,
        primarySwatch: boookPrimarySwatch,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity, 
      ),
      defaultTransition: Transition.cupertino,
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: appRouter,
    );
  }
}