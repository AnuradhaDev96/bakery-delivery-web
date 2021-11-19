import 'package:bakery_delivery_web/constants/screen_sizes.dart';
import 'package:flutter/material.dart';


class ResponsiveWidget extends StatelessWidget {
   ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);
  final Widget largeScreen;
  Widget? mediumScreen;
  Widget? smallScreen;  

  //returns true if size is smaller than 852
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < widthOfSmallScreen;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= widthOfSmallScreen &&
      MediaQuery.of(context).size.width <= widthOfLargeScreen;

  //returns true if size is greater than 1200
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > widthOfLargeScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      if (maxWidth > widthOfLargeScreen){
        return largeScreen;
      } else if (maxWidth >= widthOfSmallScreen && maxWidth <= widthOfLargeScreen){
        return mediumScreen ?? largeScreen;
      } else {
        return smallScreen ?? largeScreen;
      }
    });
  }
}
