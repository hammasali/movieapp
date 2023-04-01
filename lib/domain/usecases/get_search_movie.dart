
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_search_params.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetSearchMovie extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  GetSearchMovie(this.repository);
  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams movieSearchParams) async {
    return await repository.getSearchedMovie(movieSearchParams.searchTerm);
  }
}
