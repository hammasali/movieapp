import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;
  const MovieTabbedState(this.currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  MovieTabbedInitial(int currentTabIndex) : super(currentTabIndex);
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  MovieTabChanged({required int currentTabIndex, required this.movies})
      : super(currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;

  const MovieTabLoadError({
    required this.errorType,
    required int currentTabIndex,
  }) : super(currentTabIndex);
}
