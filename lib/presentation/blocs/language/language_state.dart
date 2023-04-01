
import 'dart:ui';

import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  LanguageLoaded(this.locale);

  @override
  List<Object?> get props => [locale.languageCode];
}
