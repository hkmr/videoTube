import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_tube/components/IconButtonWithTitle.dart';
import 'package:video_tube/components/VideoCard.dart';
import 'package:video_tube/models/Video.dart';
import 'package:video_tube/screens/videoDetail.dart';

class RecommendedVideos extends StatefulWidget {

  final Video currentVideo;
  RecommendedVideos({@required this.currentVideo});

  @override
  _RecommendedVideosState createState() => _RecommendedVideosState();
}

class _RecommendedVideosState extends State<RecommendedVideos> {

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  Widget _videoQualitySelect(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => VideoDetail(currentVideo: widget.currentVideo)
              ));
            },
            child: Chip(
              label: Text('360'),
              elevation: 0.0,
            ),
          ),
        ],
      )
    );
  }


  Widget _videoChannel(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(widget.currentVideo.channelImage),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.0),
              child: Text(widget.currentVideo.channelName,style: TextStyle(color: Colors.white)
              ),
          ),
        ],
      ),
    );
  }

  Widget _videoDescription() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _videoQualitySelect(),
          Text(widget.currentVideo.title,style: TextStyle(color: Colors.white,fontSize: 24.0),),
          Text('${NumberFormat.compact().format(widget.currentVideo.views)} views - ${widget.currentVideo.uploadTime} ago',style: TextStyle(color: Colors.white54, fontSize: 16.0),),
          _videoChannel(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButtonWithTitle(icon: Icons.thumb_up,title: '12K'),
              IconButtonWithTitle(icon: Icons.thumb_down,title: '128'),
              IconButtonWithTitle(icon: Icons.share,title: 'Share'),
              IconButtonWithTitle(icon: Icons.playlist_add,title: 'Save'),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          _videoDescription(),
          Divider(color: Colors.white,),
          VideoCard(
            currentVideo: Video(
                title: 'Learn React JS - Full Course for Beginners - Tutorial 2019',
                images: imgList,
                channelImage: 'https://yt3.ggpht.com/a-/AOh14GgwaiCp63JOClbTXswJ4u8x9IXpD_qDn3tt3g=s68-c-k-c0x00ffffff-no-rj-mo',
                views: 124256,
                channelName: 'freeCodeCamp.org',
                uploadTime: '1 year',
                videoUrl: 'https://s62.bigcdn.cc/pubs/5f3812c2868e15.96607617/360.mp4',
                category: 'category 1',
                tags: ['tag1 tag2']
            ),
            isHomeCard: false,
          ),
          VideoCard(
            currentVideo: Video(
                title: 'Learn React JS - Full Course for Beginners - Tutorial 2019',
                images: imgList,
                channelImage: 'https://yt3.ggpht.com/a-/AOh14GgwaiCp63JOClbTXswJ4u8x9IXpD_qDn3tt3g=s68-c-k-c0x00ffffff-no-rj-mo',
                views: 124256,
                channelName: 'freeCodeCamp.org',
                uploadTime: '1 year',
                videoUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
                category: 'category 1',
                tags: ['tag1 tag2']
            ),
            isHomeCard: false,
          ),
        ],
      ),
    );
  }
}

