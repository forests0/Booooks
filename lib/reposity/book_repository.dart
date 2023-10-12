
import 'package:booook/model/book/book_data.dart';
import 'package:booook/model/failure/failure.dart';
import 'package:booook/reposity/_repository_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookRepository {
  static final BookRepository _repository = BookRepository._internal();
  factory BookRepository() => _repository;
  BookRepository._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.154.1:3000',
      connectTimeout: const Duration(
        milliseconds: 10000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 10000,
      ),
    ),
  );

  Future<Either<Failure, List<BookData>>> getBookData({
    required int pageNo,
  }) async {
    try {
      final response = await _dio.get('/api/books/$pageNo');
      if (response.statusCode == 200) {
        final fromData = response.data as List<dynamic>;
        final result = fromData.map((e) => BookData.fromJson(e)).toList();
        return right(result);
      }
      return left(RepositoryServices.instance.handler());
    } on DioException catch (e) {
      return left(RepositoryServices.instance.handler(dio: e));
    } catch (e) {
      return left(RepositoryServices.instance.handler(exception: e));
    }
  }

  Future<Either<Failure, BookDetailData>> getBookDetailData({
    required int itemId,
  }) async {
    try {
      final response = await _dio.get('/api/book/detail/$itemId');
      if (response.statusCode == 200) {
        final fromData = response.data as Map<String,dynamic>;
        final result  = BookDetailData.fromJson(fromData);
        return right(result);
      }
      return left(RepositoryServices.instance.handler());
    } on DioException catch (e) {
      return left(RepositoryServices.instance.handler(dio: e));
    } catch (e) {
      return left(RepositoryServices.instance.handler(exception: e));
    }
  }
}