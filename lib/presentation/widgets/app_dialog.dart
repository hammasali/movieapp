
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/widgets/button.dart';
import 'package:movie_app/presentation/widgets/separator.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_8),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_8.h,
          left: Sizes.dimen_16.h,
          right: Sizes.dimen_16.h,
          bottom: Sizes.dimen_8.h,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: Sizes.dimen_16,
              color: AppColor.vulcan,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: Sizes.dimen_10,
            ),
            Separator(),
            SizedBox(
              height: Sizes.dimen_10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_6),
              child: Text(
                description.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(
              height: Sizes.dimen_10,
            ),
            image!,
            SizedBox(
              height: Sizes.dimen_10,
            ),
            Button(
              text: TranslationConstants.okay,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
