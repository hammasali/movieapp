import 'package:equatable/equatable.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {
  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less then 0');

  @override
  List<Object> get props => [defaultIndex];
}
