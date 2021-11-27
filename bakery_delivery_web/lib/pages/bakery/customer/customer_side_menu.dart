import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:bakery_delivery_web/provider/customer_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerSideMenu extends StatelessWidget {
  const CustomerSideMenu({Key? key, required this.dashContext, }) : super(key: key);
  // changeTheScreen(){
    
  // }
  final BuildContext dashContext;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logo.png",
              height: 10,
              width: 10,
            ),
          ),
          DrawerTile(title: "Dashboard", icon: Icons.home, onPressAction: (){
            // context.watch<MenuController>().setCurrentScreen(CustomerScreenEnum.dashboard); 
            Provider.of<CustomerMenuProvider>(dashContext, listen: false).setCurrentScreen(CustomerScreenEnum.dashboard);  
          },),
          DrawerTile(title: "Subscriptions", icon: Icons.subscriptions, onPressAction: (){
            // context.watch<MenuController>().setCurrentScreen(CustomerScreenEnum.subscriptions); 
            Provider.of<CustomerMenuProvider>(dashContext, listen: false).setCurrentScreen(CustomerScreenEnum.subscriptions);           
          }),
          const DrawerTile(title: "Previous Orders", icon: Icons.skip_previous),
          const DrawerTile(title: "Settings", icon: Icons.settings),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {Key? key, required this.title, required this.icon, this.onPressAction})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback? onPressAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressAction,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFonts.ubuntu(fontSize: 12, color: Colors.black),
      ),
    );
  }
}
