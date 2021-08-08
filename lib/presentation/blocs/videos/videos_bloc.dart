import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/domain/usecases/get_videos.dart';

import 'videos_event.dart';
import 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({required this.getVideos}) : super(VideoInitial());

  @override
  Stream<VideosState> mapEventToState(VideosEvent event) async* {
    if (event is VideoLoadEvent) {
      final Either<AppError, List<VideoEntity>> eitherResponse =
          await getVideos(MovieParams(event.movieId));
      yield eitherResponse.fold(
        (l) => NoVideo(),
        (r) => VideoLoaded(r),
      );
    }
  }
}
