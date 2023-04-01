import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_event.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_state.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:movie_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../widgets/app_error_widget.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final InAppReview _inAppReview = InAppReview.instance;
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 3,
    remindDays: 5,
    remindLaunches: 3,
    appStoreIdentifier: '15476527',
  );

  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  late MovieTabbedBloc movieTabbedBloc;
  late SearchMoviesBloc searchMoviesBloc;

  @override
  void initState() {
    super.initState();

    /// Use either of todos. Comment one TODOs before testing.
    /// First (Rate my app) is use for testing.
    /// Second (In app review can be use in production)

    // TODO : Rate my app.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await rateMyApp.init();
      if (mounted && rateMyApp.shouldOpenDialog) {
        rateMyApp.showStarRateDialog(
          context,
          title: 'Rate this app',
          message: 'Please leave a rating!',
          dialogStyle: const DialogStyle(
            // Custom dialog styles.
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),
          actionsBuilder: (context, stars) {
            return [
              TextButton(
                child: Text('Ok'),
                onPressed: () async {
                  await rateMyApp
                      .callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop<RateMyAppDialogButton>(
                      context, RateMyAppDialogButton.rate);
                },
              ),
            ];
          },
          starRatingOptions: const StarRatingOptions(),
          onDismissed: () =>
              rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
        );
      }
    });

    // TODO : In APP Review.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await rateMyApp.init();
      if (mounted && rateMyApp.shouldOpenDialog) {
        if (await _inAppReview.isAvailable()) {
          Future.delayed(const Duration(seconds: 2), () {
            _inAppReview.requestReview();
          });
        }
      }
    });

    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    searchMoviesBloc = getItInstance<SearchMoviesBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieTabbedBloc.close();
    searchMoviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider(
          create: (context) => movieTabbedBloc,
        ),
        BlocProvider(
          create: (context) => searchMoviesBloc,
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const NavigationDrawerCustom(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex,
                      )),
                  FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: MovieTabbedWidget()),
                ],
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
                errorType: state.errorType,
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
