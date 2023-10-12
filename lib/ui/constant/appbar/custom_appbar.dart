import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/report/report_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar customAppbar({
  Function()? backAction,
  bool? isReport,
  int? itemId,
  String? title
}) {
  return AppBar(
    backgroundColor: CustomColors.gs400,
    elevation: 0,
    toolbarHeight: 56,
    leading: GestureDetector(
      onTap: backAction ?? () => Get.back(),
      child: SvgPicture.asset(
        'assets/svgs/back.svg',
        width: 24,
        height: 24,
        fit: BoxFit.none,
      ),
    ),
    actions: isReport == null
        ? null
        : [
            GestureDetector(
              onTap: () => Get.to(() => ReportCreateScreen(
                    itemId: itemId!,
                    isUpdate: isReport,
                    title: title!,
                  )),
              child: SvgPicture.asset(
                'assets/svgs/${isReport ? 'edit' : 'write'}.svg',
                width: 24,
                height: 24,
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
  );
}
