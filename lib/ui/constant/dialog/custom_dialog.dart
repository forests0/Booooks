
import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/theme/text-style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> customDialog({
  required String title,
  required String description,
  required Function() onTap,
  bool isReverse = false,
}) async {
  await Get.dialog(
    AlertDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.all(
        0,
      ),
      insetPadding: const EdgeInsets.all(
        0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      backgroundColor: CustomColors.gs400,
      title: SizedBox(
        width: Get.width - 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 32,
              ),
              child: Text(
                title,
                style: CustomTextStyle.subtitle1_700.copyWith(
                  color: CustomColors.g800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              description,
              style: CustomTextStyle.body3_400.copyWith(
                color: CustomColors.gs100,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: isReverse
                          ? onTap
                          : () {
                              Get.back();
                            },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        color: CustomColors.g200,
                        alignment: Alignment.center,
                        child: Text(
                          isReverse ? '확인' : '취소',
                          style: CustomTextStyle.body1_400.copyWith(
                            color: CustomColors.g800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:  isReverse
                          ? () {
                              Get.back();
                            }
                          : onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        color: CustomColors.p500,
                        alignment: Alignment.center,
                        child: Text(
                          isReverse ? '취소' : '확인',
                          style: CustomTextStyle.body1_400.copyWith(
                            color: CustomColors.gs400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}
