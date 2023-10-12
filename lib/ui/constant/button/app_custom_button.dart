import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/theme/text-style.dart';
import 'package:flutter/material.dart';

GestureDetector wideSquareBoxwithText({
  required String text,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(
        bottom: 2
      ),
      width: double.infinity,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: CustomColors.p500,
      ),
      child: Text(
        text,
        style: CustomTextStyle.body2_500.copyWith(
          color: CustomColors.gs400,
        ),
      ),
    ),
  );
}