
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';

class CastState extends Equatable {
  const CastState();
  @override
  List<Object?> get props => [];
}

class CastInitial extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> casts;

  CastLoaded({required this.casts});

  @override
  List<Object?> get props => [casts];
}

class CastError extends CastState {}
