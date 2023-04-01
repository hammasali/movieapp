
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';

//typ = what does the UseCase return{output}
//Params = what is required to call api {input}

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
