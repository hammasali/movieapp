
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_details_screen.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movieEntity;

  const SearchMovieCard({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMovieValid(movieEntity)) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieEntity.id!),
            ),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_16.w,
                  vertical: Sizes.dimen_2.w,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiConstant.BASE_IMAGE_URL}${movieEntity.posterPath}',
                    width: Sizes.dimen_80.w,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movieEntity.tittle.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      movieEntity.overview.toString(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  bool isMovieValid(MovieEntity movieEntity) {
    if (movieEntity.posterPath == null || movieEntity.posterPath == "")
      return false;

    return true;
  }
}
