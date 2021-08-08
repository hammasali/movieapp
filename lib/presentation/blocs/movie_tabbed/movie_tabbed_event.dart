import 'package:equatable/equatable.dart';

abstract class MovieTabbedEvent extends Equatable {
  MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEvent extends MovieTabbedEvent {
  final int currentTabIndex;

  MovieTabChangedEvent({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}
