import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/translation_constants.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;
  const WatchVideoScreen({
    Key? key,
    required this.watchVideoArguments,
  }) : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _video;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _video = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
        initialVideoId: _video[0].key,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(TranslationConstants.watchTrailers.t(context))),
      ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: ProgressBarColors(
                playedColor: Colors.amber, handleColor: Colors.amberAccent),
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
              ],
            );
          }),
    );
  }
}
