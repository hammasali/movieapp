
import 'package:movie_app/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  late final bool? adult;
  late final List<String>? alsoKnownAs;
  late final String? biography;
  late final String? birthday;
  late final Null deathday;
  late final int? gender;
  late final Null homepage;
  late final int id;
  late final String? imdbId;
  late final String? knownForDepartment;
  late final String? name;
  late final String? placeOfBirth;
  late final double? popularity;
  late final String? profilePath;

  PersonModel({
    this.adult,
    this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    required this.id,
    this.imdbId,
    this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  }) : super(
          id: id,
          biography: biography,
          birthday: birthday,
          name: name,
          placeOfBirth: placeOfBirth,
          popularity: popularity,
          profilePath: profilePath,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      adult: json['adult'],
      alsoKnownAs: List.castFrom<dynamic, String>(json['also_known_as']),
      biography: json['biography'] == null ? '' : json['biography'],
      birthday: json['birthday'] == null ? '' : json['birthday'],
      deathday: null,
      gender: json['gender'],
      homepage: null,
      id: json['id'],
      imdbId: json['imdb_id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      placeOfBirth:
          json['place_of_birth'] == null ? '' : json['place_of_birth'],
      popularity: json['popularity'] == null ? '' : json['popularity'],
      profilePath: json['profile_path'] == null ? '' : json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['also_known_as'] = alsoKnownAs;
    _data['biography'] = biography;
    _data['birthday'] = birthday;
    _data['deathday'] = deathday;
    _data['gender'] = gender;
    _data['homepage'] = homepage;
    _data['id'] = id;
    _data['imdb_id'] = imdbId;
    _data['known_for_department'] = knownForDepartment;
    _data['name'] = name;
    _data['place_of_birth'] = placeOfBirth;
    _data['popularity'] = popularity;
    _data['profile_path'] = profilePath;
    return _data;
  }
}
