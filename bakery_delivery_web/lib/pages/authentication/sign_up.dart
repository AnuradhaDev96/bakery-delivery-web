import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/sign_up_large.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveWidget(largeScreen: const SignUpLarge())
    );
  }
}