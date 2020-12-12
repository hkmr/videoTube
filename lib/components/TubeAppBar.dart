import 'package:flutter/material.dart';

class TubeAppBar{

  static Widget topAppBar(){
    return AppBar(
      backgroundColor: Colors.black12,
      title: Text('PPTube',style: TextStyle(color: Colors.white),),
      leading: Icon(Icons.play_circle_filled, size: 32, color: Colors.red,),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.videocam,color: Colors.white,),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.search,color: Colors.white,),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: (){},
        )
      ],
    );
  }

}