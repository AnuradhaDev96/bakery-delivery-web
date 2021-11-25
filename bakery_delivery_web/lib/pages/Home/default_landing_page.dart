import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:bakery_delivery_web/helpers/style.dart';
import 'package:bakery_delivery_web/pages/Home/widgets/large_screen.dart';
import 'package:bakery_delivery_web/widgets/main_drawer.dart';
import 'package:bakery_delivery_web/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class DefaultLandingPage extends StatefulWidget {
  const DefaultLandingPage({Key? key}) : super(key: key);

  @override
  _DefaultLandingPageState createState() => _DefaultLandingPageState();
}

class _DefaultLandingPageState extends State<DefaultLandingPage> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldState,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: NavBar(homeScaffoldKey: scaffoldState),
      ),
      drawer: const MainDrawer(),
      backgroundColor: backgroundColor,
      body: ResponsiveWidget(largeScreen: const LandingLarge()),
      
    );
  }
}
