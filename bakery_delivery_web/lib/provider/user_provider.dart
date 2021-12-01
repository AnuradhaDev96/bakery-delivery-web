import 'package:bakery_delivery_web/api/models/responses/authenticated_user.dart';
import 'package:bakery_delivery_web/api/services/auth.dart';
import 'package:bakery_delivery_web/constants/comman_fields.dart';
import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // firebase.Messaging messaging = firebase.messaging();

  // AuthService authService = AuthService();

  late AuthStatus _authStatus = AuthStatus.landing;
  AuthStatus get authStatus => _authStatus;
  set authStatus(AuthStatus authStatus) {
    _authStatus = authStatus;
    notifyListeners();
  }

  late AuthenticatedUser _loggedUser;
  AuthenticatedUser get loggedUser => _loggedUser;
  set loggedUser(AuthenticatedUser loggedUser) {
    _loggedUser = loggedUser;
    notifyListeners();
  }

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  void setAuthenticatedApp  (AuthenticatedUser authenticatedUser, AuthStatus status) {    
    loggedUser = authenticatedUser;
    authStatus = status;
    setSignInPreferences();
  }

  Future<void> setSignInPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(CommonFields.isLoggedIn, true);
    prefs.setString(CommonFields.uid, loggedUser.uid);
    prefs.setString(CommonFields.token, loggedUser.token);
    prefs.setString(CommonFields.email, loggedUser.email);
    prefs.setString(CommonFields.fullName, loggedUser.fullName);
    notifyListeners();
  }

  void changeAuthstatus(AuthStatus status) {
    authStatus = status;
  }

  void setUnauthenticatedApp(){
    changeAuthstatus(AuthStatus.landing);
    setSignOutPreferences();
  }

  Future<void> setSignOutPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(CommonFields.isLoggedIn, false);
    prefs.remove(CommonFields.uid);
    prefs.remove(CommonFields.token);
    prefs.remove(CommonFields.email);
    prefs.remove(CommonFields.fullName);
    notifyListeners();
  }

  // void registerDeviceToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? deviceToken = await messaging.getToken();
  //   if (deviceToken != null) {
  //     await authService.updateDeviceToken(prefs.getString('token'), deviceToken);
  //     prefs.setString('deviceToken', deviceToken);
  //   }
  //   notifyListeners();
  // }
}
