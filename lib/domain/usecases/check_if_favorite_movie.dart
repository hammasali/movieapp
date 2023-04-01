
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository repository;

  CheckIfFavoriteMovie(this.repository);
  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await repository.checkIfMovieFavorite(movieParams.id);
  }
}
