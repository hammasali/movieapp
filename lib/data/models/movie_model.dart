
import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  late final String? overview;
  late final String? releaseDate;
  late final bool? adult;
  late final String? backdropPath;
  late final List<int?> genreIds;
  late final int? voteCount;
  late final String? originalLanguage;
  late final String? originalTitle;
  late final String? posterPath;
  late final bool? video;
  late final int? id;
  late final double? voteAverage;
  late final String? title;
  late final double? popularity;
  late final String? mediaType;

  MovieModel(
      {required this.overview,
      required this.releaseDate,
      required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.voteCount,
      required this.originalLanguage,
      required this.originalTitle,
      required this.posterPath,
      required this.video,
      required this.id,
      required this.voteAverage,
      required this.title,
      required this.popularity,
      required this.mediaType})
      : super(
          posterPath,
          id,
          backdropPath,
          title,
          voteAverage,
          releaseDate,
          overview,
        );
  /*super(
          id: id,
          tittle: tittle,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );*/

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      overview: json['overview'],
      releaseDate: json['release_date'].toString(),
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      voteCount: json['vote_count'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      video: json['video'],
      id: json['id'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      title: json['title'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['vote_count'] = this.voteCount;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
