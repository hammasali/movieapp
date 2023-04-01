
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/data/core/api_constants.dart';

class ImageFullWidget extends StatelessWidget {
  final String image;
  const ImageFullWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Hero(
        tag: 'image',
        child: Container(
          height: ScreenUtil.screenHeight,
          width: ScreenUtil.screenWidth,
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: '${ApiConstant.BASE_IMAGE_URL_original}$image'),
        ),
      ),
    );
  }
}
