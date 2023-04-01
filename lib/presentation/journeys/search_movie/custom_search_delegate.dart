
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';
import 'package:movie_app/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movie_app/presentation/blocs/search_movies/search_movies_event.dart';
import 'package:movie_app/presentation/blocs/search_movies/search_movies_state.dart';
import 'package:movie_app/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMoviesBloc;

  CustomSearchDelegate(this.searchMoviesBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      GestureDetector(
        child: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (query.isNotEmpty) {
          query = "";
        }

        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMoviesBloc.add(
      SearchTermChangedEvent(query),
    );
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
        bloc: searchMoviesBloc,
        builder: (context, state) {
          if (state is SearchMovieError) {
            return AppErrorWidget(
                errorType: state.errorType,
                onPressed: () =>
                    searchMoviesBloc.add(SearchTermChangedEvent(query)));
          } else if (state is SearchMovieLoaded) {
            final movies = state.movies;
            if (movies.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) => SearchMovieCard(
                  movieEntity: movies[index],
                ),
                itemCount: movies.length,
                scrollDirection: Axis.vertical,
              );
            } else {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                  child: Text(
                    TranslationConstants.noMoviesSearched.t(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
