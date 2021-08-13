import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/more_images.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/person_params.dart';
import 'package:movie_app/domain/usecases/get_more_images.dart';

import 'images_event.dart';
import 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final GetMoreImages getMoreImages;
  ImagesBloc(this.getMoreImages) : super(ImagesInitial());

  @override
  Stream<ImagesState> mapEventToState(ImagesEvent event) async* {
    if (event is ImagesLoadEvent) {
      Either<AppError, List<ProfilesModel>> eitherResponse =
          await getMoreImages(PersonParams(id: event.personId));

      yield eitherResponse.fold(
        (l) => ImagesError(),
        (r) => ImagesLoaded(r),
      );
    }
  }
}
