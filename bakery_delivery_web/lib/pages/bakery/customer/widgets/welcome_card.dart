import 'package:bakery_delivery_web/constants/app_color.dart';
import 'package:bakery_delivery_web/constants/static_texts.dart';
import 'package:bakery_delivery_web/helpers/responsive.dart';
import 'package:bakery_delivery_web/helpers/style.dart';
import 'package:bakery_delivery_web/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key}) : super(key: key);
  // String? fullName;
  Future<String> getLoggedFullName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('fullName');
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
            decoration: BoxDecoration(
              color: AppColor.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: "Good Morning "),
                          TextSpan(
                            text: userProvider.loggedUser.fullName,
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      welcomeTextOfCustomer,
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Read More",
                        style: GoogleFonts.ubuntu(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                if (!ResponsiveWidget.isSmallScreen(context)) ...{
                  const Spacer(),
                  Image.asset(
                    "assets/images/notification_image.png",
                    height: 160,
                  )
                }
              ],
            ),
          );
  }
}

// FutureBuilder(
//       future: getLoggedFullName(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Container(
//             decoration: BoxDecoration(
//               color: AppColor.yellow,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             padding: const EdgeInsets.all(defaultPadding),
//             child: Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         style: GoogleFonts.ubuntu(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                         children: [
//                           const TextSpan(text: "Good Morning "),
//                           TextSpan(
//                             text: snapshot.data.toString(),
//                             style:
//                                 GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(
//                       welcomeTextOfCustomer,
//                       style: GoogleFonts.ubuntu(
//                         color: Colors.black,
//                         fontSize: 15,
//                         letterSpacing: 1.5,
//                         height: 1.5,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: Text(
//                         "Read More",
//                         style: GoogleFonts.ubuntu(
//                           fontSize: 16.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (!ResponsiveWidget.isSmallScreen(context)) ...{
//                   const Spacer(),
//                   Image.asset(
//                     "assets/images/notification_image.png",
//                     height: 160,
//                   )
//                 }
//               ],
//             ),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
