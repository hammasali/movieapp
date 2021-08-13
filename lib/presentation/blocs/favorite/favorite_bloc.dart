import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/check_if_favorite_movie.dart';
import 'package:movie_app/domain/usecases/delete_movie.dart';
import 'package:movie_app/domain/usecases/get_favorite_movie.dart';
import 'package:movie_app/domain/usecases/save_movie.dart';

import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovie getFavoriteMovie;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteBloc({
    required this.saveMovie,
    required this.getFavoriteMovie,
    required this.deleteFavoriteMovie,
    required this.checkIfFavoriteMovie,
  }) : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(event.movieEntity.id!.toInt()));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response = await checkIfFavoriteMovie(
          MovieParams(event.movieEntity.id!.toInt()));

      yield response.fold(
        (l) => FavoriteMovieError(),
        (r) => IsFavoriteMovie(r),
      );
    } else if (event is LoadFavoriteMovieEvent) {
      yield* _fetchLoadFavoriteMovieEvent();
    } else if (event is DeleteFavoriteMovieEvent) {
      await deleteFavoriteMovie(MovieParams(event.movieId));
      yield* _fetchLoadFavoriteMovieEvent();
    } else if (event is CheckIfFavoriteMovieEvent) {
      final response = await checkIfFavoriteMovie(MovieParams(event.movieId));
      yield response.fold(
        (l) => FavoriteMovieError(),
        (r) => IsFavoriteMovie(r),
      );
    }
  }

  Stream<FavoriteState> _fetchLoadFavoriteMovieEvent() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovie(NoParams());

    yield response.fold(
      (l) => FavoriteMovieError(),
      (r) => FavoriteMovieLoaded(r),
    );
  }
}
