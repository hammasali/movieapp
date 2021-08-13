import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/more_images.dart';

class ImagesState extends Equatable {
  const ImagesState();

  @override
  List<Object?> get props => [];
}

class ImagesInitial extends ImagesState {}

class ImagesLoaded extends ImagesState {
  final List<ProfilesModel> imagesMore;

  ImagesLoaded(this.imagesMore);

  @override
  List<Object?> get props => [imagesMore];
}

class ImagesError extends ImagesState {}
