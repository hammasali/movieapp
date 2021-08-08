import 'package:flutter/cupertino.dart';
import 'package:movie_app/presentation/app_localization.dart';

extension StringExtension on String {
  String intelliTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalization.of(context)!.translate(this).toString();
  }
}
