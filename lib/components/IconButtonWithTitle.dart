import 'package:flutter/material.dart';

class IconButtonWithTitle extends StatelessWidget {

  final IconData icon;
  final String title;

  IconButtonWithTitle({
    @required this.icon,
    @required this.title,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: (){},
        ),
        Text(title,style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
