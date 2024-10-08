import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/Api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBoosks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFaliures());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatuerdBoosks() {
    // TODO: implement fetchFeatuerdBoosks
    throw UnimplementedError();
  }
}
