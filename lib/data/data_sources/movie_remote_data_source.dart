
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_app/data/models/more_images.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_result_model.dart';
import 'package:movie_app/data/models/person_model.dart';
import 'package:movie_app/data/models/video_model.dart';
import 'package:movie_app/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getSearchedMovie(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<PersonModel> getPersonDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
  Future<List<ProfilesModel>> getMoreImages(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print(movies.length.toString() + "is the Trending");
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print(movies.length.toString() + "is the Popular");
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print(movies.length.toString() + "is the ComingSoon");
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print(movies.length.toString() + "is the PlayingNow");
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    print(videos);
    return videos;
  }

  @override
  Future<List<MovieModel>> getSearchedMovie(String searchTerm) async {
    final response = await _client.get('search/movie', params: {
      'query=': searchTerm,
    });
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print(movies.length.toString() + "is the Searched");
    return movies;
  }

  @override
  Future<PersonModel> getPersonDetail(int id) async {
    final response = await _client.get('person/$id');
    final details = PersonModel.fromJson(response);
    print(details);
    return details;
  }

  @override
  Future<List<ProfilesModel>> getMoreImages(int id) async {
    final response = await _client.get('person/$id/images');
    final images = MoreImages.fromJson(response).profiles;
    print(images);
    return images;
  }
}
