import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_image.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_input_field.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_text.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custome_raised_button.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/sign_in_large.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/wsized_box.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> signInScaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveWidget(largeScreen: const SignInLarge())
    );
  }
}