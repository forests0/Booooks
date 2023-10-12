import 'package:booook/state/detail/book_detail_getx.dart';
import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/theme/text-style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// 도서 상세페이지 책 썸네일
Padding bookDetailThumbnail({
  required bool isReport,
  required String title,
  required String author,
  required String imageUrl,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Column(
      children: [
        Stack(
          children: [
            const SizedBox(
              width: 235,
            ),
            Container(
              width: 230,
              height: 342,
              decoration: BoxDecoration(
                color: CustomColors.gs400,
                borderRadius: BorderRadius.circular(
                  8,
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
              visible: isReport,
              child: Positioned(
                top: 8,
                right: 0,
                child: Image.asset(
                  'assets/images/book_report.png',
                  width: 40,
                  height: 40,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 8,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: CustomTextStyle.headline3_700.copyWith(
                color: CustomColors.g800,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            author,
            style: CustomTextStyle.caption.copyWith(
              color: CustomColors.gs200,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}


// 메인 도서 목록 리스트 책 썸네일
GestureDetector bookListThumbnail({
  required bool isReport,
  required int itemId,
  required String title,
  required String categoryAuthor,
  required String imageUrl,
}) {
  return GestureDetector(
    onTap: () {
      Get.put(BookDetailGetx())
          .getBookDetailData(item: itemId, isReport: isReport)
          .then(
            (value) => Get.toNamed('/book/$itemId?isReport=$isReport'),
          );
    },
    child: Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: ((Get.width - 56) / 2) + 5,
            ),
            Container(
              width: (Get.width - 56) / 2,
              height: (((Get.width - 56) / 2) * 248) / 167,
              decoration: BoxDecoration(
                color: CustomColors.gs400,
                borderRadius: BorderRadius.circular(
                  8,
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
              visible: isReport,
              child: Positioned(
                top: 8,
                right: 0,
                child: Image.asset(
                  'assets/images/book_report.png',
                  width: 40,
                  height: 40,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: SizedBox(
            width: ((Get.width - 56) / 2) + 5,
            child: Text(
              title,
              style: CustomTextStyle.body1_500.copyWith(
                color: CustomColors.g800,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Container(
          width: ((Get.width - 56) / 2) + 5,
          alignment: Alignment.centerRight,
          child: Text(
            categoryAuthor,
            style: CustomTextStyle.body3_400.copyWith(
              color: CustomColors.g400,
            ),
            maxLines: 2,
          ),
        ),
      ],
    ),
  );
}