import 'package:bakery_delivery_web/api/models/data/auth_credentials.dart';
import 'package:bakery_delivery_web/api/services/auth.dart';
import 'package:bakery_delivery_web/constants/app_color.dart';
import 'package:bakery_delivery_web/constants/enums.dart';
import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:bakery_delivery_web/pages/bakery/customer/customer_dashboard.dart';
import 'package:bakery_delivery_web/provider/customer_menu_provider.dart';
import 'package:bakery_delivery_web/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_image.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_input_field.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_text.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custome_raised_button.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/wsized_box.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInLarge extends StatefulWidget {
  const SignInLarge({Key? key}) : super(key: key);

  @override
  _SignInLargeState createState() => _SignInLargeState();
}

class _SignInLargeState extends State<SignInLarge> {
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static bool isLoggingChecking = false;
  AuthService authService = AuthService();

  signInWithCredentials() async {
    setState(() {
      isLoggingChecking = true;
    });
    AuthCredentials authCredentials =
        AuthCredentials(email: "anuradhashs@gmail.com", password: "admin_z");
    // AuthCredentials authCredentials = AuthCredentials(
    //     email: userNameController.text, password: passwordController.text);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await authService
          .signInUsingEmailAndPassword(authCredentials)
          .then((authenticatedUser) {
        setState(() {
          isLoggingChecking = false;
        });
        prefs.setBool('isLoggedIn', true);
        prefs.setString('uid', authenticatedUser.uid);
        prefs.setString('token', authenticatedUser.token);
        prefs.setString('email', authenticatedUser.email);
        prefs.setString('fullName', authenticatedUser.fullName);
        // prefs.setString('token', )
        // final snackBar = SnackBar(
        //   content: const Text("Successfull"),
        //   backgroundColor: Colors.green[900],
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Provider.of<UserProvider>(context, listen: false).setAuthenticatedApp(authenticatedUser, AuthStatus.authenticated);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomerDashboardPage()));
      });
    } catch (error) {
      setState(() {
        isLoggingChecking = false;
      });
      final snackBar = SnackBar(
        content: const Text("Error occured"),
        backgroundColor: Colors.red[900],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1440),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 40, 42, 57),
              width: screenSize.width * 0.7,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            height: 40,
                            width: 40,
                          ),
                          const CustomText(
                            text: '  Anywhere App.',
                            textColor: Colors.white,
                            textSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                          const WSizedBox(width: 0.1, height: 0),
                          const CustomText(
                            text: 'Home',
                            textColor: Colors.grey,
                            textSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          const WSizedBox(width: 0.1, height: 0),
                          const CustomText(
                            text: 'Join',
                            textColor: Colors.grey,
                            textSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                      const WSizedBox(width: 0, height: 0.2),
                      Row(
                        children: [
                          const WSizedBox(width: 0.05, height: 0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: 'START FOR FREE',
                                textColor: Colors.grey,
                                textSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                              const WSizedBox(width: 0, height: 0.02),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: 'Login to your account',
                                    textColor: Colors.white,
                                    textSize:
                                        ResponsiveWidget.isMediumScreen(context)
                                            ? 25.0
                                            : 40.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    height: 10,
                                    width: 10,
                                  ),
                                ],
                              ),
                              const WSizedBox(width: 0, height: 0.03),
                              Row(
                                children: const [
                                  CustomText(
                                    text: 'Not A member ?',
                                    textColor: Colors.grey,
                                    textSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  CustomText(
                                    text: ' Sign up',
                                    textColor: Colors.blue,
                                    textSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              const WSizedBox(width: 0, height: 0.03),
                              CustomInputField(
                                borderRadius: 20,
                                borderColor: AppColor.darkBlue,
                                width: 0.32,
                                height: 0.05,
                                icon: Icons.mail,
                                iconColor: Colors.grey,
                                hintText: 'email',
                                hintColor: Colors.grey,
                                fontSize: 15,
                                obsecureText: false,
                                textEditingController: userNameController,
                              ),
                              const WSizedBox(width: 0, height: 0.02),
                              CustomInputField(
                                borderRadius: 20,
                                borderColor: AppColor.darkBlue,
                                width: 0.32,
                                height: 0.05,
                                icon: Icons.lock,
                                iconColor: Colors.grey,
                                hintText: 'password',
                                hintColor: Colors.grey,
                                fontSize: 15,
                                obsecureText: true,
                                textEditingController: passwordController,
                              ),
                              const WSizedBox(width: 0, height: 0.04),
                              // isLoggingChecking
                              // ? const Center(
                              //     child: LinearProgressIndicator(
                              //     color: Colors.yellow,
                              //     minHeight: 5,
                              //   ))
                              // :
                              CustomRaisedButton(
                                buttonTitle: 'login to my account',
                                width: 0.32,
                                height: 0.05,
                                borderColor:
                                    const Color.fromARGB(255, 29, 144, 244),
                                borderRadius: 25,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontColor: Colors.white,
                                onPressedAction: () {
                                  signInWithCredentials();
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
          // const CustomImage(
          //     height: 1,
          //     width: 0.5,
          //     assetImagePath: 'assets/images/loginBg.png',
          //   ),
        ],
      ),
    );
  }
}
