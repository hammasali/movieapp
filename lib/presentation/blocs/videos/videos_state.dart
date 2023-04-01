
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/video_entity.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object?> get props => [];
}

class VideoInitial extends VideosState {}

class NoVideo extends VideosState {}

class VideoLoaded extends VideosState {
  final List<VideoEntity> videos;

  VideoLoaded(this.videos);
  @override
  List<Object?> get props => [videos];
}
