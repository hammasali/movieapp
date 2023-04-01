
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/more_images.dart';
import 'package:movie_app/domain/entities/person_entity.dart';
import 'package:movie_app/presentation/blocs/images/images_bloc.dart';
import 'package:movie_app/presentation/blocs/images/images_state.dart';
import 'package:movie_app/presentation/journeys/more_images/more_image_screen.dart';

class PersonBigPoster extends StatelessWidget {
  final PersonEntity personEntity;
  const PersonBigPoster({
    Key? key,
    required this.personEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<ProfilesModel> imageList;
    return BlocBuilder<ImagesBloc, ImagesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state is ImagesLoaded) {
              imageList = state.imagesMore;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MoreImageScreen(
                  imageList: imageList,
                ),
              ));
            }
          },
          child: Stack(
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
                child: Hero(
                  tag: 'image',
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiConstant.BASE_IMAGE_URL}${personEntity.profilePath}',
                    width: ScreenUtil.screenWidth,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ListTile(
                  title: Text(
                    personEntity.name.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    personEntity.placeOfBirth.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Text(
                    age(personEntity.birthday),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              Positioned(
                left: Sizes.dimen_16.w,
                right: Sizes.dimen_16.w,
                top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: Sizes.dimen_12.h,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MoreImageScreen(
                            imageList: imageList,
                          ),
                        ));
                      },
                      child: Icon(
                        Icons.add_to_photos_outlined,
                        color: Colors.white,
                        size: Sizes.dimen_12.h,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String age(String? birthday) {
    if (birthday!.isNotEmpty) {
      int year = int.parse(birthday.split("-").first);
      int yearNow = int.parse(DateTime.now().toString().split("-").first);

      return (yearNow - year).toString();
    }
    return '';
  }
}
