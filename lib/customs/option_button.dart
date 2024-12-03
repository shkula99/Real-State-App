import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(
      {super.key, required this.text, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: COLOR_DARK_BLUE,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          // Add your action here
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizontalSpace(10),
            Text(
              text,
              style: TextStyle(color: COLOR_WHITE),
            ),
          ],
        ),
      ),
    );
  }
}
