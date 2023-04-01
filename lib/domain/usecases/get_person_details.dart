
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/person_entity.dart';
import 'package:movie_app/domain/entities/person_params.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetPersonDetails extends UseCase<PersonEntity, PersonParams> {
  final MovieRepository repository;

  GetPersonDetails(this.repository);
  @override
  Future<Either<AppError, PersonEntity>> call(PersonParams personParams) async {
    return await repository.getPersonDetails(personParams.id);
  }
}
