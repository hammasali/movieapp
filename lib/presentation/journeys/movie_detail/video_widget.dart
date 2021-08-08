import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie_app/presentation/blocs/videos/videos_state.dart';
import 'package:movie_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:movie_app/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:movie_app/presentation/widgets/button.dart';

class VideoWidget extends StatelessWidget {
  final VideosBloc videosBloc;
  const VideoWidget({Key? key, required this.videosBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: videosBloc,
        builder: (context, state) {
          if (state is VideoLoaded && state.videos.iterator.moveNext()) {
            final _videos = state.videos;
            return Button(
              text: TranslationConstants.watchTrailers,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WatchVideoScreen(
                        watchVideoArguments: WatchVideoArguments(_videos))));
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
