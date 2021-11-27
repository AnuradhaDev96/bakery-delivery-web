import 'package:bakery_delivery_web/api/models/responses/authenticated_user.dart';
import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  late AuthStatus _authStatus = AuthStatus.landing;
  AuthStatus get authStatus => _authStatus;
  set authStatus(AuthStatus authStatus){
    _authStatus = authStatus;
    notifyListeners();
  }

  late AuthenticatedUser _loggedUser;
  AuthenticatedUser get loggedUser => _loggedUser;
  set loggedUser(AuthenticatedUser loggedUser){
    _loggedUser = loggedUser;
    notifyListeners();
  }

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  void setAuthenticatedApp(AuthenticatedUser authenticatedUser, AuthStatus status) {
    loggedUser = authenticatedUser;
    authStatus = status;
  }

  void changeAuthstatus(AuthStatus status){
    authStatus = status;
  }
  

}
