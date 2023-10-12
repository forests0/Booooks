import 'package:booook/state/detail/book_detail_getx.dart';
import 'package:booook/ui/constant/appbar/custom_appbar.dart';
import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/thumbnail/book_thumbnail.dart';
import 'package:booook/ui/detail/widgets/book_detail_contents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailScreen extends StatelessWidget {
  final int itemId = int.parse(Get.parameters['itemId'].toString());
  final bool isReport = bool.parse(Get.parameters['isReport'].toString());
  BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookDetailGetx>(
      builder: (x) {
        return Scaffold(
          backgroundColor: CustomColors.gs400,
          appBar: customAppbar(
            isReport: isReport,
            itemId: itemId,
            title: x.book!.title,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: bookDetailThumbnail(
                    isReport: isReport,
                    title: x.book!.title,
                    author: x.book!.author,
                    imageUrl: x.book!.imageUrl,
                  ),
                ),
                bookContents(
                  title: '책소개',
                  description: x.book!.introduce,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Divider(
                    height: 10,
                    thickness: 10,
                    color: CustomColors.g200,
                  ),
                ),
                bookContents(
                  title: '독후감',
                  description: x.report,
                  date: x.reportDate,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

