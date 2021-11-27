import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:bakery_delivery_web/helpers/style.dart';
import 'package:bakery_delivery_web/pages/bakery/customer/customer_side_menu.dart';
import 'package:bakery_delivery_web/pages/bakery/customer/header_bar.dart';
import 'package:bakery_delivery_web/provider/customer_menu_provider.dart';
import 'package:bakery_delivery_web/pages/bakery/customer/widgets/welcome_card.dart';
// import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Widget currentScreen = const DashboardContent();
 
  final PageStorageBucket screenBucket = PageStorageBucket();

  // final List<Widget> screens = [const DashboardContent()];

  // void changeScreenByValue(CustomerScreenEnum enump){
  //   switch(enump){
  //     case CustomerScreenEnum.dashboard:
  //       setState(() {
  //         currentScreen = const DashboardContent();
  //       });
  //       break;
  //     case CustomerScreenEnum.subscriptions:
  //       setState(() {
  //         currentScreen = const SubscriptionContent();
  //       });
  //       break;
  //   }
  // }
  

  @override
  Widget build(BuildContext context) {
    //  var currentScreen = context.watch<MenuController>().currentScreen;
    return Scaffold(
      key: context.read<CustomerMenuProvider>().customerHomeScaffoldState,
      drawer:  CustomerSideMenu(dashContext: context,),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ResponsiveWidget.isLargeScreen(context))
             Expanded(
              child: CustomerSideMenu(dashContext: context,),
            ),
          Expanded(
            flex: 5,
            // child: DashboardContent(),
            child: PageStorage(bucket: screenBucket, child: context.watch<CustomerMenuProvider>().currentScreen),
          ),
        ],
      )),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);  

  @override
  Widget build(BuildContext context) {    
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const HeaderBar(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const WelcomeCard(),
                      const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        NotificationCard(cardColor: active),
                    ],
                  ),
                ),
                if (!ResponsiveWidget.isSmallScreen(context))
                  const SizedBox(width: defaultPadding),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Expanded(flex: 2, child: NotificationCard(cardColor: active))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required this.cardColor}) : super(key: key);
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Dashboard",
              style: GoogleFonts.ubuntu(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding),
          Container(
            margin: const EdgeInsets.only(top: defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
              borderRadius: const BorderRadius.all(
                Radius.circular(defaultPadding),
              ),
            ),
            child: Text("This is the area",
                style: GoogleFonts.ubuntu(
                    fontSize: 12, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}


class SubscriptionContent extends StatelessWidget {
  const SubscriptionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const HeaderBar(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      NotificationCard(cardColor: disable,),
                      const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        const SizedBox(height: defaultPadding),
                      if (ResponsiveWidget.isSmallScreen(context))
                        NotificationCard(cardColor: disable),
                    ],
                  ),
                ),
                if (!ResponsiveWidget.isSmallScreen(context))
                  const SizedBox(width: defaultPadding),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Expanded(flex: 2, child: NotificationCard(cardColor: disable))
              ],
            )
          ],
        ),
      ),
    );
  }
}