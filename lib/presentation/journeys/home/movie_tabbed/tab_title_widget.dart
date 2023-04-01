
import 'package:flutter/material.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          (title).t(context),
          style: isSelected
              ? Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColor.royalBlue,
                  fontWeight: FontWeight.bold) //chek it
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
