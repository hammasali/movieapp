import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieBackdropEvent extends Equatable {
  MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movie;

  MovieBackdropChangedEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
