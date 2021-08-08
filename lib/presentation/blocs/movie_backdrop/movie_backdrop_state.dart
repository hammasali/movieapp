import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieBackdropState extends Equatable {
  MovieBackdropState();

  @override
  List<Object> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackdropChanged extends MovieBackdropState {
  final MovieEntity movie;

  MovieBackdropChanged(this.movie);

  @override
  List<Object> get props => [movie];
}
