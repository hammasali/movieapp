import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function() onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: Sizes.dimen_8,
          ),
          ButtonBar(
            children: [
              Button(
                text: TranslationConstants.retry,
                onPressed: onPressed,
              ),
              Button(
                text: TranslationConstants.feedback,
                onPressed: () => Wiredash.of(context)!.show(),
              )
            ],
          )
        ],
      ),
    );
  }
}
