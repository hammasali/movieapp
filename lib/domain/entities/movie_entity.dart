
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String? posterPath;
  final int? id;
  final String? backdropPath;
  final String? tittle;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  MovieEntity(
    this.posterPath,
    this.id,
    this.backdropPath,
    this.tittle,
    this.voteAverage,
    this.releaseDate,
    this.overview,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [id, tittle];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      movieDetailEntity.posterPath,
      movieDetailEntity.id,
      movieDetailEntity.backdropPath,
      movieDetailEntity.title,
      movieDetailEntity.voteAverage,
      movieDetailEntity.releaseDate,
      movieDetailEntity.overview,
    );
  }
}
