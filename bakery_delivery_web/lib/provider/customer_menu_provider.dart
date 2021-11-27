import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:bakery_delivery_web/pages/bakery/customer/dashboard.dart';
import 'package:flutter/material.dart';

class CustomerMenuProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _customerHomeScaffoldState = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get customerHomeScaffoldState => _customerHomeScaffoldState;

  void controlMenu(){
    if(!_customerHomeScaffoldState.currentState!.isDrawerOpen){
      _customerHomeScaffoldState.currentState!.openDrawer();
    }
  }

  late Widget _currentScreen = const DashboardContent();
  Widget get currentScreen => _currentScreen;
  set currentScreen(Widget newScreeen) {
    _currentScreen = newScreeen;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  setCurrentScreen(CustomerScreenEnum cus){
    switch(cus){
      case CustomerScreenEnum.dashboard:
        currentScreen = const DashboardContent();
        // setState(() {
        //   currentScreen = const DashboardContent();
        // });
        break;
      case CustomerScreenEnum.subscriptions:
        currentScreen = const SubscriptionContent();
        // setState(() {
        //   currentScreen = const SubscriptionContent();
        // });
        break;
    }
  }



  // void changeCustomerScreen(){
  //   _customerHomeScaffoldState.currentState!.widget.onDrawerChanged
  // }
}