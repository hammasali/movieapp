
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/person_entity.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object?> get props => [];
}

class PersonDetailsInitial extends PersonState {}

class PersonDetailsLoading extends PersonState {}

class PersonDetailsError extends PersonState {}

class PersonDetailsLoaded extends PersonState {
  final PersonEntity personEntity;

  PersonDetailsLoaded(this.personEntity);
  @override
  List<Object?> get props => [personEntity];
}
