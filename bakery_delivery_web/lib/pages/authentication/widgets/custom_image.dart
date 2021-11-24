import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {Key? key,
      this.assetImagePath,
      this.networkImagePath,
      this.cardStyle,
      required this.width,
      required this.height,
      this.borderRadius})
      : super(key: key);

  final String? assetImagePath, networkImagePath, cardStyle;
  final double width, height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: assetImagePath != null
                ? AssetImage(assetImagePath!)
                : NetworkImage(networkImagePath!) as ImageProvider,
            fit: BoxFit.fill),
        borderRadius: borderRadius != null
            ? cardStyle != null
                ? BorderRadius.only(
                    topLeft: Radius.circular(borderRadius!),
                    topRight: Radius.circular(borderRadius!))
                : BorderRadius.circular(borderRadius!)
            : BorderRadius.circular(0),
      ),
    );
  }
}
