import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerContainer extends StatefulWidget {

  final String videoUrl;
  VideoPlayerContainer({
    @required this.videoUrl,
  });

  @override
  _VideoPlayerContainerState createState() => _VideoPlayerContainerState();
}

class _VideoPlayerContainerState extends State<VideoPlayerContainer> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      aspectRatio: 16/9,
      looping: true,
      allowMuting: true,
      errorBuilder: (context, errorMsg){
        return Center(
          child: Text(
            errorMsg,
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Chewie(
          key: _key,
          controller: _chewieController,
        )
      ),
    );
  }
}
