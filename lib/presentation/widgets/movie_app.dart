import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/blocs/language/language_bloc.dart';
import 'package:movie_app/presentation/blocs/language/language_state.dart';
import 'package:movie_app/presentation/journeys/home/home_screen.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';
import 'package:movie_app/presentation/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WireDashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  primaryColor: AppColor.vulcan,
                  accentColor: AppColor.royalBlue,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                home: HomeScreen(),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
