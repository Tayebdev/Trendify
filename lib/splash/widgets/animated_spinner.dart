import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/helpers/function_helpers.dart';

class AnimatedLoadingSpinner extends StatelessWidget {
  const AnimatedLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Center(
      child: SpinKitSpinningLines(
        color: dark
            ? AppColors.black
            : AppColors.white,
        size: 80.0,
        lineWidth: 3.0,
      ),
    );
  }
}
