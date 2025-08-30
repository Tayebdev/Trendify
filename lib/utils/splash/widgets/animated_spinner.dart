import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trendify_app/core/constant/app_colors.dart';

class AnimatedLoadingSpinner extends StatelessWidget {
  const AnimatedLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitSpinningLines(
        color: AppColors.primary,
        size: 70.0,
        lineWidth: 3.0,
      ),
    );
  }
}
