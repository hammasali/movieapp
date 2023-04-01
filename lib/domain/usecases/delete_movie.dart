
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository repository;

  DeleteFavoriteMovie(this.repository);
  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await repository.deleteFavoriteMovie(movieParams.id);
  }
}
