import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_details_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final int? movieId;
  final String? posterPath;

  const MovieCardWidget(
      {Key? key, required this.movieId, required this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 32,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieId!),
            ),
          ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstant.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
