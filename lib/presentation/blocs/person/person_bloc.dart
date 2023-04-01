
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/person_entity.dart';
import 'package:movie_app/domain/entities/person_params.dart';
import 'package:movie_app/domain/usecases/get_person_details.dart';
import 'package:movie_app/presentation/blocs/images/images_bloc.dart';
import 'package:movie_app/presentation/blocs/images/images_event.dart';

import 'person_event.dart';
import 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetPersonDetails getPersonDetails;
  final ImagesBloc imagesBloc;

  PersonBloc({
    required this.getPersonDetails,
    required this.imagesBloc,
  }) : super(PersonDetailsInitial());

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event is PersonDetailsLoadedEvent) {
      final Either<AppError, PersonEntity> eitherResponse =
          await getPersonDetails(PersonParams(id: event.personId));
      yield eitherResponse.fold(
        (l) => PersonDetailsError(),
        (r) => PersonDetailsLoaded(r),
      );
      imagesBloc.add(ImagesLoadEvent(event.personId));
    }
  }
}
