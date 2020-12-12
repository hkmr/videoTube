import 'package:flutter/material.dart';
import 'package:video_tube/components/VideoCard.dart';
import 'package:video_tube/models/Video.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'fastporndelivery.hqporner.com/imgs/61/65/490e63bd3eec9b4_5.jpg',
    'fastporndelivery.hqporner.com/imgs/61/65/490e63bd3eec9b4_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          new VideoCard(
            currentVideo: Video(
              title: 'Learn React JavaScript - Full Course for Beginners - Tutorial 2019',
              images: imgList,
              channelImage: 'https://yt3.ggpht.com/a-/AOh14GgwaiCp63JOClbTXswJ4u8x9IXpD_qDn3tt3g=s68-c-k-c0x00ffffff-no-rj-mo',
              views: 124256,
              channelName: 'freeCodeCamp.org',
              uploadTime: '1 year',
              videoUrl:'https://s41.bigcdn.cc/pubs/5f380b872f9253.18969239/360.mp4',
              category: 'category 1',
              tags: ['tag1 tag2']
            ),
            isHomeCard: true,
          ),
          new VideoCard(
            currentVideo: Video(
                title: 'Learn React JS - Full Course for Beginners - Tutorial 2019',
                images: imgList,
                channelImage: 'https://yt3.ggpht.com/a-/AOh14GgwaiCp63JOClbTXswJ4u8x9IXpD_qDn3tt3g=s68-c-k-c0x00ffffff-no-rj-mo',
                views: 124256,
                channelName: 'freeCodeCamp.org',
                uploadTime: '1 year',
                videoUrl:'https://s62.bigcdn.cc/pubs/5f3810bf291845.33153084/360.mp4',
                category: 'category 1',
                tags: ['tag1 tag2']
            ),
            isHomeCard: true,
          ),
        ],
      ),
    );
  }
}
