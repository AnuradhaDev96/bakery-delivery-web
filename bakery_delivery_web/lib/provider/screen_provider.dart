import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:bakery_delivery_web/pages/Home/default_landing_page.dart';
import 'package:bakery_delivery_web/pages/authentication/sign_in.dart';
import 'package:bakery_delivery_web/pages/bakery/customer/customer_dashboard.dart';
import 'package:bakery_delivery_web/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenProvider extends StatelessWidget {
  const ScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    switch (userProvider.authStatus) {
      case AuthStatus.landing:
        return const DefaultLandingPage();
      case AuthStatus.unauthenticated:
        return const SignInPage();
      case AuthStatus.authenticated:
        {
          // if (userProvider.loggedUser.userType == "Rider"){
          //   return const SignInPage();
          // }
          return const CustomerDashboardPage();
        }
      default:
        return const DefaultLandingPage();
    }
  }
}
