import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/theme/text-style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding bookContents({
  required String title,
  required String description,
  List<String>? imageUrls,
  String? date,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: CustomTextStyle.subtitle1_700.copyWith(
                color: CustomColors.g800,
              ),
            ),
            if (date != null) ...[
              Text(
                date,
                style: CustomTextStyle.body3_400.copyWith(
                  color: CustomColors.g400,
                ),
              ),
            ]
          ],
        ),
        if (imageUrls != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: imageUrls.length > 1
                      ? const PageScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      for (int i = 0; i < 2; i++) ...[
                        Container(
                          width: Get.width - 40,
                          height: Get.width - 40,
                          color: i % 2 == 0 ? CustomColors.gs200 : CustomColors.gs100,
                        ),
                      ],
                    ],
                  ),
                ),
                if (imageUrls.length > 1) ...[
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: CustomColors.gs300,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      child: Text(
                        '1/2',
                        style: CustomTextStyle.body3_500.copyWith(
                          color: CustomColors.gs400,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ] else ...[
          const SizedBox(
            height: 8,
          ),
        ],
        Text(
          description,
          style: CustomTextStyle.body2_400.copyWith(
            color: CustomColors.g800,
          ),
        ),
      ],
    ),
  );
}
