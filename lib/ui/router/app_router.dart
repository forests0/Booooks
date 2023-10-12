import 'package:booook/ui/detail/book_detail_screen.dart';
import 'package:booook/ui/main/boook_app.dart';
import 'package:get/get.dart';

List<GetPage> appRouter = [
  GetPage(name: '/',
  page: () => const BoookApp(), 
  transition: Transition.fadeIn,
  transitionDuration: const Duration(
    milliseconds: 500,
  )
  ),

  GetPage(name: '/book/:itemId',
  page: () => BookDetailScreen(), 
  transition: Transition.fadeIn,
  transitionDuration: const Duration(
    milliseconds: 500,
  )
  )
];