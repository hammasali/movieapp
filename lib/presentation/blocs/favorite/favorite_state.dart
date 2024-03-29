
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMovieLoaded extends FavoriteState {
  final List<MovieEntity> movies;

  FavoriteMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class FavoriteMovieError extends FavoriteState {}

class IsFavoriteMovie extends FavoriteState {
  final bool isMovieFavorite;

  IsFavoriteMovie(this.isMovieFavorite);

  @override
  List<Object> get props => [isMovieFavorite];
}
