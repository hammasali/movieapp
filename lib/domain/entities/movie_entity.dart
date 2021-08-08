import 'package:equatable/equatable.dart';

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
}
