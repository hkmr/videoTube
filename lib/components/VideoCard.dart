import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_tube/models/Video.dart';
import 'package:video_tube/screens/videoDetail.dart';

class VideoCard extends StatefulWidget {

  final Video currentVideo;
  final bool isHomeCard;

  VideoCard({
    @required this.currentVideo,
    @required this.isHomeCard
  });

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.isHomeCard ? Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => VideoDetail(currentVideo: widget.currentVideo)
        )) : Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => VideoDetail(currentVideo: widget.currentVideo)
        ));
      },
      child: Card(
        color: Colors.black26,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            VideoCardImage(widget.currentVideo.images,),
            VideoCardDescription(
              avatarUrl: widget.currentVideo.channelImage,
              uploadTime: widget.currentVideo.uploadTime,
              channelName: widget.currentVideo.channelName,
              title: widget.currentVideo.title,
              viewsCount: widget.currentVideo.views,
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCardImage extends StatelessWidget {
  final List<String> images;
  VideoCardImage(this.images);

  List<Widget> _getImages() {
    List<Widget> imgs = [];

    images.forEach((element) {
      imgs.add(Image(
        image: NetworkImage(element),
        fit: BoxFit.fill,
        height: 250,
      ));
    });

    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: CarouselSlider(
      items: _getImages(),
      options: CarouselOptions(
          height: 250,
          aspectRatio: 16/9,
        initialPage: 0,
        autoPlay: false,
        enableInfiniteScroll: false,
      ),
    ));
  }
}

class VideoCardDescription extends StatelessWidget {
  final String avatarUrl;
  final String title;
  final String channelName;
  final int viewsCount;
  final String uploadTime;

  VideoCardDescription({
    @required this.avatarUrl,
    @required this.title,
    @required this.channelName,
    @required this.viewsCount,
    @required this.uploadTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          VideoCardTitleAndChannel(
            title: title,
            viewsCount: viewsCount,
            channelName: channelName,
            uploadTime: uploadTime,
          ),
        ],
      ),
    );
  }
}

class VideoCardTitleAndChannel extends StatelessWidget {
  final String title;
  final String channelName;
  final int viewsCount;
  final String uploadTime;

  VideoCardTitleAndChannel({
    @required this.title,
    @required this.channelName,
    @required this.viewsCount,
    @required this.uploadTime,
  });

  final TextStyle _style = TextStyle(fontSize: 12.0, color: Colors.white70);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 16, color: Colors.white)),
            Text(
              '$channelName - ${NumberFormat.compact().format(viewsCount)} views - $uploadTime ago',
              style: _style,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
