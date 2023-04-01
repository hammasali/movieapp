
import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class VideoLoadEvent extends VideosEvent {
  final int movieId;

  VideoLoadEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
