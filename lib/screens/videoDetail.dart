import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_tube/components/RecommendedVideos.dart';
import 'package:video_tube/components/videoPlayerContainer.dart';
import 'package:video_tube/models/Video.dart';

class VideoDetail extends StatefulWidget {

  final Video currentVideo;
  VideoDetail({@required this.currentVideo});

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {

  @override
  Widget build(BuildContext context) {

    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: _screenHeight / 3,
              color: Colors.black12,
              child: VideoPlayerContainer(videoUrl: widget.currentVideo.videoUrl),
            ),
            RecommendedVideos(currentVideo: widget.currentVideo)
          ],
        ),
      ),
    );
  }
}
