import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/more_images.dart';
import 'package:movie_app/data/models/video_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/person_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetails(int id);
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);
  Future<Either<AppError, PersonEntity>> getPersonDetails(int id);
  Future<Either<AppError, List<VideoModel>>> getVideos(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovie(
      String searchTerm);
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);
  Future<Either<AppError, List<ProfilesModel>>> getMoreImages(int id);
}
