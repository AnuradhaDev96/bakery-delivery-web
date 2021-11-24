import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({ Key? key, this.iconColor, required this.size, required this.icon }) : super(key: key);

  final Color? iconColor;
  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0.0),
      color: iconColor ?? Colors.white,
      icon: Icon(icon, size: size),
      onPressed: () {},
    );
  }
}