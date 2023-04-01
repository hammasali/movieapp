
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';

class PersonOtherDetails extends StatelessWidget {
  final String fieldName;
  final String fieldData;

  const PersonOtherDetails({
    Key? key,
    required this.fieldName,
    required this.fieldData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
        vertical: Sizes.dimen_12.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(fieldName + " :",
                  style: Theme.of(context).textTheme.headline6),
              Container(
                width: 200,
                child: Text(fieldData,
                    maxLines: 4, style: Theme.of(context).textTheme.subtitle1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
