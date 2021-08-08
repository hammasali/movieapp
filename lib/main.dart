import 'package:flutter/widgets.dart';
import 'package:movie_app/presentation/widgets/movie_app.dart';

import 'di/get_it.dart' as getIt;

void main() {
  getIt.init();
  runApp(MovieApp());
}
