import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int id;
  final String? biography;
  final String? birthday;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;
  PersonEntity({
    required this.id,
    required this.biography,
    required this.birthday,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [id];
}
