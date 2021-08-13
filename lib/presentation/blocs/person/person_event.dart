import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class PersonDetailsLoadedEvent extends PersonEvent {
  final int personId;

  PersonDetailsLoadedEvent(this.personId);

  @override
  List<Object> get props => [personId];
}
