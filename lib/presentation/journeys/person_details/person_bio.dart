import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

class PersonBio extends StatefulWidget {
  final String personBio;
  const PersonBio({Key? key, required this.personBio}) : super(key: key);

  @override
  _PersonBioState createState() => _PersonBioState();
}

class _PersonBioState extends State<PersonBio> {
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w,
        vertical: Sizes.dimen_12.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                onTap = !onTap;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Biography", style: Theme.of(context).textTheme.headline6),
                Icon(
                  onTap
                      ? Icons.arrow_drop_down_sharp
                      : Icons.arrow_drop_up_sharp,
                  color: AppColor.royalBlue,
                  size: Sizes.dimen_40.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.personBio,
            maxLines: onTap ? null : 8,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
