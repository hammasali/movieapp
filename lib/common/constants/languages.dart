import 'package:movie_app/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity('en', 'English'),
    LanguageEntity('hi', 'Hindi'),
    LanguageEntity('es', 'Spanish'),
  ];
}
