import 'movie_model.dart';

class MoviesResultModel {
  late List<MovieModel> movies = [];

  MoviesResultModel({
    required this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      //results = List<MovieModel>();

      json['results'].forEach((v) {
        movies.add(new MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.movies.map((v) => v.toJson()).toList();
    return data;
  }
}
