import 'package:flutter/material.dart';
import 'package:movie_app/data/models/more_images.dart';
import 'package:movie_app/presentation/journeys/more_images/image_full_widget.dart';

class MoreImageScreen extends StatefulWidget {
  final List<ProfilesModel> imageList;
  const MoreImageScreen({Key? key, required this.imageList}) : super(key: key);

  @override
  _MoreImageScreenState createState() => _MoreImageScreenState();
}

class _MoreImageScreenState extends State<MoreImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageFullWidget(
            image: widget.imageList[index].filePath,
          );
        },
      ),
    );
  }
}
