import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBoosks();
  Future<Either<Failure, List<BookModel>>> fetchFeatuerdBoosks();
  Future<Either<Failure, List<BookModel>>> fetchSimilardBoosks(
      {required String category});
}
