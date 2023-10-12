import 'dart:io';
import 'package:booook/state/auth/auth_getx.dart';
import 'package:booook/state/home/main_getx.dart';
import 'package:booook/ui/constant/footer/custom_refresh_footer.dart';
import 'package:booook/ui/constant/theme/colors.dart';
import 'package:booook/ui/constant/theme/text-style.dart';
import 'package:booook/ui/constant/thumbnail/book_thumbnail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BoookMain extends StatelessWidget {
  const BoookMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainGetx>(
      builder: (x) {
        return Scaffold(
          backgroundColor: CustomColors.gs400,
          body: SafeArea(
            child: SmartRefresher(
              enablePullDown: Platform.isIOS ? false : true,
              enablePullUp: true,
              controller: x.refreshController,
              onRefresh: () {
                x.onRefresh();
              },
              onLoading: () {
                x.onLoading();
              },
              footer: customRefreshFooter(
                isLastItem: false,
              ),
              header: MaterialClassicHeader(
                color: CustomColors.p500,
              ),
              child: CustomScrollView(
                slivers: [
                  if (Platform.isIOS) ...[
                    CupertinoSliverRefreshControl(
                      refreshTriggerPullDistance: 40.0,
                      refreshIndicatorExtent: 30.0,
                      onRefresh: () async {
                        x.onRefresh();
                      },
                    ),
                  ],
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 72,
                        bottom: 16,
                        left: 20,
                        right: 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: '안녕하세요.\n',
                          style: CustomTextStyle.headline1_700.copyWith(
                            color: CustomColors.g800,
                          ),
                          children: [
                            TextSpan(
                              text: AuthGetx.to.name.value,
                              style: CustomTextStyle.headline1_700.copyWith(
                                color: CustomColors.p500,
                              ),
                            ),
                            TextSpan(
                              text: '님!',
                              style: CustomTextStyle.headline1_700.copyWith(
                                color: CustomColors.g800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 32,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                bookListThumbnail(
                                  isReport: x.books[index * 2].isReport ?? false,
                                  itemId: x.books[index * 2].itemId,
                                  title:  x.books[index * 2].title,
                                  categoryAuthor:  x.books[index * 2].author,
                                  imageUrl:  x.books[index * 2].imageUrl,
                                ),
                                if ((index * 2) + 1 < x.books.length) ...[
                                  bookListThumbnail(
                                    isReport: x.books[(index * 2) + 1].isReport ?? false,
                                    itemId: x.books[(index * 2) + 1].itemId,
                                    title: x.books[(index * 2) + 1].title,
                                    categoryAuthor: x.books[(index * 2) + 1].author,
                                    imageUrl: x.books[(index * 2) + 1].imageUrl,
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                        addAutomaticKeepAlives: true,
                        childCount: (x.books.length % 2 == 0
                            ? x.books.length ~/ 2
                            : (x.books.length ~/ 2) + 1),
                      ),
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
