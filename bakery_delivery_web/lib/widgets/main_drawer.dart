import 'package:bakery_delivery_web/helpers/style.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: active,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  "Pricing",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Log in",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              const Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child:  Text(
                  "Copyright © 2020 | Deliver Bakes",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
