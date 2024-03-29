
import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/widgets/movie_app_bar.dart';
import 'package:movie_app/presentation/widgets/separator.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({required this.movies, required this.defaultIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
