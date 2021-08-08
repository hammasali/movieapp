import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_event.dart';

import 'movie_carousel_event.dart';
import 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(this.getTrending, this.movieBackdropBloc)
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final movieEither = await getTrending(NoParams());
      yield movieEither.fold(
        (l) => MovieCarouselError(l.appErrorType),
        (movies) {
          movieBackdropBloc
              .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          return MovieCarouselLoaded(
              movies: movies, defaultIndex: event.defaultIndex);
        },
      );
    }
  }
}
