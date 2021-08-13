import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/size_extensions.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';
import 'package:movie_app/presentation/blocs/language/language_bloc.dart';
import 'package:movie_app/presentation/blocs/language/language_event.dart';
import 'package:movie_app/presentation/journeys/favorite/favorite_screen.dart';
import 'package:movie_app/presentation/widgets/app_dialog.dart';
import 'package:movie_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

import 'navigation_expanded_list_item.dart';
import 'navigation_list_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 4)
        ],
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_1.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.h,
                right: Sizes.dimen_8.h,
              ),
              child: Logo(
                height: Sizes.dimen_18.h,
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavoriteScreen()));
              },
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context)
                    .add(ToggleLanguageEvent(Languages.languages[index]));
              },
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context)!.show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showDailog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showDailog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AppDialog(
          title: TranslationConstants.about,
          description: TranslationConstants.aboutDescription,
          buttonText: TranslationConstants.okay,
          image: Image.asset(
            'assets/pngs/tmdb_logo.png',
            height: Sizes.dimen_32.h,
          ),
        );
      },
    );
  }
}
