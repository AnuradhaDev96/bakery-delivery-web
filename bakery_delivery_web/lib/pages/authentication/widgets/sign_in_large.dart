import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_image.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_input_field.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custom_text.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/custome_raised_button.dart';
import 'package:bakery_delivery_web/pages/authentication/widgets/wsized_box.dart';

class SignInLarge extends StatefulWidget {
  const SignInLarge({Key? key}) : super(key: key);

  @override
  _SignInLargeState createState() => _SignInLargeState();
}

class _SignInLargeState extends State<SignInLarge> {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
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
                                      textSize: ResponsiveWidget.isMediumScreen(
                                              context)
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
                                const CustomInputField(
                                    borderRadius: 20,
                                    borderColor:
                                        Color.fromARGB(255, 50, 54, 69),
                                    width: 0.32,
                                    height: 0.05,
                                    icon: Icons.mail,
                                    iconColor: Colors.grey,
                                    hintText: 'email',
                                    hintColor: Colors.grey,
                                    fontSize: 15,
                                    obsecureText: false),
                                const WSizedBox(width: 0, height: 0.02),
                                const CustomInputField(
                                    borderRadius: 20,
                                    borderColor:
                                        Color.fromARGB(255, 50, 54, 69),
                                    width: 0.32,
                                    height: 0.05,
                                    icon: Icons.lock,
                                    iconColor: Colors.grey,
                                    hintText: 'password',
                                    hintColor: Colors.grey,
                                    fontSize: 15,
                                    obsecureText: true),
                                const WSizedBox(width: 0, height: 0.04),
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
                                  onPressedAction: () {},
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
        ));
  }
}
