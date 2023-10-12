import 'package:booook/state/report/report_getx.dart';
import 'package:booook/ui/constant/appbar/custom_appbar.dart';
import 'package:booook/ui/constant/button/app_custom_button.dart';
import 'package:booook/ui/constant/dialog/custom_dialog.dart';
import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/theme/text-style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportCreateScreen extends StatelessWidget {
  final int itemId;
  final bool isUpdate;
  final String title;
  const ReportCreateScreen({
    super.key,
    required this.itemId,
    required this.title,
    this.isUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportGetx>(
      init: ReportGetx()
        ..started(
          itemId: itemId,
          isUpdate: isUpdate,
        ),
      builder: (x) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: CustomColors.gs400,
            appBar: customAppbar(backAction: () {
              FocusScope.of(context).unfocus();
              customDialog(
                title: '독후감 작성 취소',
                description: '작성했던 내용은 저장되지 않습니다.\n정말 그만 작성하시겠습니까?',
                onTap: () {
                  Get
                    ..back()
                    ..back();
                },
              );
            }),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          child: Text(
                            title,
                            style: CustomTextStyle.body1_700.copyWith(
                              color: CustomColors.g800,
                            ),
                          ),
                        ),
                        Divider(
                          height: 8,
                          thickness: 8,
                          color: CustomColors.p500,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 24,
                            ),
                            width: Get.width - 40,
                            height: Get.width - 40,
                            color: CustomColors.gs400,
                            child: TextFormField(
                              controller: x.reportController,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: '어떤 책이었나요?',
                                hintStyle: CustomTextStyle.body2_400.copyWith(
                                  color: CustomColors.gs200,
                                ),
                                border: InputBorder.none,
                              ),
                              style: CustomTextStyle.body2_400.copyWith(
                                color: CustomColors.g800,
                              ),
                              onChanged: (value) => x.changedReport(
                                text: value,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: wideSquareBoxwithText(
                      text: isUpdate ? '수정 완료' : '저장',
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        customDialog(
                          title: '독후감 ${isUpdate ? '수정' : '저장'}',
                          description: '독후감을 ${isUpdate ? '수정' : '저장'}하시겠습니까?',
                          isReverse: true,
                          onTap: () {
                            x.submitReport(
                              isUpdate: isUpdate,
                              itemId: itemId,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
