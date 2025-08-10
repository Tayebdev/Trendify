import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../circular_contianer/circular_container.dart';
import 'custom_rounded_edge.dart';

// ignore: must_be_immutable
class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomRoundedEdge(),
      child: Container(
        color: AppColors.primary,
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: CircularContainer(
                backgroundColor: AppColors.white.withValues(alpha: 0.1),
                height: AppSizes.homeprimaryHeaderHight,
                width: AppSizes.homeprimaryHeaderHight,
              ),
            ),
            Positioned(
              top: 60,
              right: -250,
              child: CircularContainer(
                backgroundColor: AppColors.white.withValues(alpha: 0.1),
                height: AppSizes.homeprimaryHeaderHight,
                width: AppSizes.homeprimaryHeaderHight,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
