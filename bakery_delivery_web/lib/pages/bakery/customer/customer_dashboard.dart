import 'package:bakery_delivery_web/pages/bakery/customer/dashboard.dart';
import 'package:bakery_delivery_web/provider/customer_menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDashboardPage extends StatelessWidget {
  const CustomerDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomerMenuProvider(),
        ),
      ],
      child: const DashboardScreen(),
    );
  }
}
