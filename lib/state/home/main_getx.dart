
import 'package:booook/model/book/book_data.dart';
import 'package:booook/model/error/error_status_data.dart';
import 'package:booook/model/failure/failure.dart';
import 'package:booook/reposity/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainGetx extends GetxController {
  static MainGetx get to => Get.find();
  RefreshController refreshController = RefreshController();

  bool isLoading = false;
  final BookRepository _bookRepository = BookRepository();
  ErrorStatusData errorStatusData = ErrorStatusData.empty();
  List<BookData> books = [];
  int pageNo = 1;
  bool isLastItem = false;

  void onRefresh() async {
    await getBookListData();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await getBookListData(
      page: pageNo,
    );
    refreshController.loadComplete();
  }

  Future<void> getBookListData({
    int? page,
  }) async {
    if (!isLoading) {
      isLoading = true;
      update();

      Either<Failure, List<BookData>> successOrFailure =
          await _bookRepository.getBookData(
        pageNo: page ?? 1,
      );

      successOrFailure.fold((l) {
        l.map(
          networkError: (e) => errorStatusData = errorStatusData.copyWith(
            isNetwork: true,
          ),
          apiError: (e) => errorStatusData = errorStatusData.copyWith(
            isApi: true,
          ),
        );
        isLoading = false;
        update();
      }, (r) async {
        final SharedPreferences pref = await SharedPreferences.getInstance();
        List<BookData> tempList = [];

        r.forEach(
          (e) => tempList.add(
            e.copyWith(
              isReport: pref.getString(e.itemId.toString()) != null,
            ),
          ),
        );

        if (page == null) {
          books = tempList;
          
        } else {
          books.addAll(tempList);
        }

        pageNo = pageNo + 1;
        errorStatusData = ErrorStatusData.empty();
        isLoading = false;
        if (r.length < 20) {
          isLastItem = true;
        }
        update();
      });
    }
  }

  Future updateBookInfo({
    required int itemId,
  }) async {
    int temp = books.indexWhere((e) => e.itemId == itemId);
    books[temp] = books[temp].copyWith(
      isReport: true,
    );
    update();
  }
}
