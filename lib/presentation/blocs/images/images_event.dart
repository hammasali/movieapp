
import 'package:equatable/equatable.dart';

abstract class ImagesEvent extends Equatable {}

class ImagesLoadEvent extends ImagesEvent {
  final int personId;

  ImagesLoadEvent(this.personId);

  @override
  List<Object?> get props => [personId];
}
