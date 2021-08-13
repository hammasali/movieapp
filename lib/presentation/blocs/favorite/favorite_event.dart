import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteMovieEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class DeleteFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  DeleteFavoriteMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  ToggleFavoriteMovieEvent(this.movieEntity, this.isFavorite);

  @override
  List<Object> get props => [movieEntity, isFavorite];
}

class CheckIfFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  CheckIfFavoriteMovieEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
