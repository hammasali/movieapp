import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/more_images.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/person_params.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetMoreImages extends UseCase<List<ProfilesModel>, PersonParams> {
  final MovieRepository repository;

  GetMoreImages(this.repository);
  @override
  Future<Either<AppError, List<ProfilesModel>>> call(
      PersonParams personParams) async {
    return await repository.getMoreImages(personParams.id);
  }
}
