
import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? posterPath;

  ProfileEntity({
    required this.posterPath,
  });

  @override
  List<Object?> get props => [posterPath];
}
