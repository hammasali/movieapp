import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMoviesState {}

class SearchMovieLoaded extends SearchMoviesState {
  final List<MovieEntity> movies;

  SearchMovieLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}

class SearchMovieLoading extends SearchMoviesState {}

class SearchMovieError extends SearchMoviesState {
  final AppErrorType errorType;

  SearchMovieError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
