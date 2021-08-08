import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabbedConstants {
  static const List<Tab> movieTabs = const [
    const Tab(0, TranslationConstants.popular),
    const Tab(1, TranslationConstants.now),
    const Tab(2, TranslationConstants.soon),
  ];
}
