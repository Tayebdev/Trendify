import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.backgroundColor = AppColors.white,
    this.child,
    this.padding,
    this.margin,
    this.height = 400,
    this.width = 400,
  });

  final Color backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
