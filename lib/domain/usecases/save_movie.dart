
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository repository;

  SaveMovie(this.repository);
  @override
  Future<Either<AppError, void>> call(MovieEntity movieEntity) async {
    return await repository.saveMovie(movieEntity);
  }
}
