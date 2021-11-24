import 'package:flutter/material.dart';

class WSizedBox extends StatelessWidget {
  const WSizedBox({Key? key, required this.width, required this.height})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * height);
  }
}
