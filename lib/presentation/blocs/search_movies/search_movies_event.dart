
import 'package:equatable/equatable.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class SearchTermChangedEvent extends SearchMoviesEvent {
  final String searchTerm;

  SearchTermChangedEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
