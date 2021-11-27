import 'dart:convert';
import 'package:bakery_delivery_web/api/configuration/api_config.dart';
import 'package:bakery_delivery_web/api/models/data/auth_credentials.dart';
import 'package:bakery_delivery_web/api/models/responses/authenticated_user.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class AuthService {
  Future<AuthenticatedUser> signInUsingEmailAndPassword(AuthCredentials authCredentials) async {
    
    var response = await post(
      Uri.parse(ApiConfig.baseUrl + 'auth/signin'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(authCredentials.toMap())
    );
    print(response.statusCode);
    if (response.statusCode == 200){
        var returnBody = jsonDecode(response.body);
        
        var userData = returnBody['userData'];
        print(userData['uid']);
        AuthenticatedUser authenticatedUser = AuthenticatedUser(email: userData['email'], uid: userData['uid'], token: returnBody['token'], userType: userData['userType'], fullName: userData['fullName']);
        return authenticatedUser;      
      } else {
        throw Exception('Failed to get');
      }
    
  }
}
