import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/cast/cast_state.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastLoaded) {
        return Container(
          height: Sizes.dimen_100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.casts.length,
            itemBuilder: (context, index) {
              final castEntity = state.casts[index];
              return Container(
                height: Sizes.dimen_100.h,
                width: Sizes.dimen_160.w,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_8.w,
                    vertical: Sizes.dimen_4.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.dimen_8.w),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(Sizes.dimen_8.w),
                          ),
                          child: CachedNetworkImage(
                            height: Sizes.dimen_100.h,
                            width: Sizes.dimen_160.w,
                            imageUrl:
                                '${ApiConstant.BASE_IMAGE_URL}${castEntity.posterPath}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_8.w,
                        ),
                        child: Text(
                          castEntity.name.toString(),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: AppColor.vulcan),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Sizes.dimen_8.w,
                          right: Sizes.dimen_8.w,
                          bottom: Sizes.dimen_2.h,
                        ),
                        child: Text(
                          castEntity.character.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: AppColor.royalBlue),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
