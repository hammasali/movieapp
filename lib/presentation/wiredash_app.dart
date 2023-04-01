
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WireDashApp({
    Key? key,
    this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie_app-ck1srzj',
      secret: 'bJyWIxFt6Ll8NSvkjZRGPrsqS2sXnBlR',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
          locale: Locale.fromSubtags(
        languageCode: languageCode,
      )),
      theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan),
    );
  }
}
