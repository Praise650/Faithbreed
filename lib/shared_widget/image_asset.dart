import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
double height;
double width;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        'images/pneuma_logo_3.png',
      ),
      height: height,
      width: width,
    );
  }
}
