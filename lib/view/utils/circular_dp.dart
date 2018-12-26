import 'package:flutter/material.dart';

class CircularDP extends StatelessWidget{
  final String image;

  CircularDP(this.image);

  @override
    Widget build(BuildContext context) {
      return Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(image)
          )
        ),
      );
    }
}