import 'package:flutter/cupertino.dart';

class Video{

  String title;
  int views;
  String uploadTime;
  String videoUrl;
  List<String> images;
  String channelName;
  String channelImage;
  List<String> tags;
  String category;

  Video({
    @required String title,
    @required int views,
    @required String uploadTime,
    @required String videoUrl,
    @required List<String> images,
    @required String channelName,
    @required String channelImage,
    @required List<String> tags,
    @required String category}){
    this.title = title;
    this.views = views;
    this.uploadTime = uploadTime;
    this.videoUrl = videoUrl;
    this.images = images;
    this.channelName = channelName;
    this.channelImage = channelImage;
    this.tags = tags;
    this.category = category;
  }


}