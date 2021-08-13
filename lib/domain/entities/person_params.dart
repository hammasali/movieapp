import 'package:equatable/equatable.dart';

class PersonParams extends Equatable {
  final int id;

  PersonParams({required this.id});

  @override
  List<Object?> get props => [id];
}
