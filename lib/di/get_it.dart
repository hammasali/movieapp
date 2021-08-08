import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movies_repositories.dart';
import 'package:movie_app/domain/usecases/get_cast_crew.dart';
import 'package:movie_app/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/domain/usecases/get_playing_now.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/domain/usecases/get_videos.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/language/language_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  // all dependency goes here
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  //All use case
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));
  getItInstance
      .registerLazySingleton<GetCastCrew>(() => GetCastCrew(getItInstance()));
  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));
  // bloc
  getItInstance.registerFactory(() => MovieCarouselBloc(
        getItInstance(),
        getItInstance(),
      ));
  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(
      () => MovieTabbedBloc(getItInstance(), getItInstance(), getItInstance()));

  getItInstance.registerFactory(() => MovieDetailBloc(
        getMovieDetail: getItInstance(),
        castBloc: getItInstance(),
        videosBloc: getItInstance(),
      ));
  getItInstance.registerFactory(() => CastBloc(
        getItInstance(),
      ));
  getItInstance.registerFactory(
    () => VideosBloc(
      getVideos: getItInstance(),
    ),
  );
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
