import 'package:flutter/material.dart';
import 'package:home_design/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? width, hight;

  const BorderBox({super.key, this.padding, this.width, this.hight, required this.child});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)
      ),
      padding: padding ?? EdgeInsets.all(8.0),
      child: child,
    );
  }
}
