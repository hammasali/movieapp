
import 'package:equatable/equatable.dart';

abstract class CastEvent extends Equatable {}

class CastLoadEvent extends CastEvent {
  final int movieId;

  CastLoadEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
