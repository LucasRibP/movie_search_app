import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  final double? width;
  final double? height;

  const ImageNotFound({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[350],
        width: width,
        height: height,
        child: Center(
            child: Text(
          "?",
          style: TextStyle(color: Colors.grey[800]),
        )));
  }
}
