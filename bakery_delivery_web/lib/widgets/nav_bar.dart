import 'package:bakery_delivery_web/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.homeScaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> homeScaffoldKey;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List _isHovering = [false, false];
  Widget drawerButton(GlobalKey<ScaffoldState> scaffoldKey) {
    return IconButton(
        icon: Icon(Icons.menu, color: active,),
        onPressed: (){
          scaffoldKey.currentState!.openDrawer();
        },

      );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            const SizedBox(width: 20.0),
            drawerButton(widget.homeScaffoldKey),
            const SizedBox(width: 5.0),
            Image.asset(              
              "assets/images/logo.png",
              height: 30,
              width: 30,
              ),
            Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SizedBox(width: screenSize.width / 8),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[0] = true : _isHovering[0] = false;
                  });
                },
                hoverColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(
                      "Princing",
                      style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: _isHovering[0] ? active : disable),
                    ),
                    const SizedBox(height: 5.0),
                    Visibility(
                        visible: _isHovering[0],
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        child: Container(
                          height: 5.0,
                          width: 5.0,
                          decoration: BoxDecoration(
                              color: active,
                              borderRadius: BorderRadius.circular(20)),
                        ))
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                hoverColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12.0),
                    Text(
                      "Download",
                      style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: _isHovering[1] ? active : disable),
                    ),
                    const SizedBox(height: 5.0),
                    Visibility(
                        visible: _isHovering[1],
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        child: Container(
                          height: 5.0,
                          width: 5.0,
                          decoration: BoxDecoration(
                              color: active,
                              borderRadius: BorderRadius.circular(20)),
                        ))
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
