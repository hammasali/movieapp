
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.dimen_1.h),
          ),
          gradient:
              LinearGradient(colors: [AppColor.violet, AppColor.royalBlue])),
    );
  }
}
