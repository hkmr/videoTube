import 'package:flutter/material.dart';
import 'file:///E:/Projects/flutter/video_tube/lib/screens/Home.dart';
import 'package:video_tube/components/TubeAppBar.dart';
import 'package:video_tube/screens/Explore.dart';
import 'package:video_tube/screens/Library.dart';

void main() {
  runApp(VideoApp());
}

class VideoApp extends StatefulWidget {

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    Explore(),
    Library()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPTube',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: TubeAppBar.topAppBar(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            unselectedItemColor: Colors.white54,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontSize: 10.0),
            unselectedLabelStyle: TextStyle(fontSize: 10.0),
            onTap: (index) => {
              this.setState(() {_currentIndex = index;})
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                title: Text('Library'),
              ),
            ],
            currentIndex: _currentIndex,
          ),
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}
