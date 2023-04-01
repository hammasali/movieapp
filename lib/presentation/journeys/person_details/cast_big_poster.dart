
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';

class CastBigPoster extends StatelessWidget {
  final CastEntity castEntity;
  const CastBigPoster({
    Key? key,
    required this.castEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.1),
                  Theme.of(context).primaryColor,
                ]),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstant.BASE_IMAGE_URL}${castEntity.posterPath}',
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              castEntity.name.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              castEntity.character.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
          ),
        )
      ],
    );
  }
}
