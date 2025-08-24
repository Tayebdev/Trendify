import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/helpers/function_helpers.dart';
import '../view/screen/onboarding_view.dart';
import 'widgets/animated_app_name.dart';
import 'widgets/animated_logo.dart';
import 'widgets/animated_spinner.dart';
import 'widgets/animated_tagline.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 30000,
      splash: _buildSplashContent(context),
      splashIconSize: double.infinity,
      backgroundColor: Colors.transparent,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: const OnboardingView(),
    );
  }

  Widget _buildSplashContent(BuildContext context) {
    final dark=AppHelperFunctions.isDarkMode(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration:  BoxDecoration(
            color: dark ? AppColors.black: AppColors.white
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedLogo(),
              const SizedBox(height: 20),
              AnimatedAppName(),
              const SizedBox(height: 15),
              AnimatedTagline(),
              const SizedBox(height: 100),
              AnimatedLoadingSpinner(),
            ],
          ),
        ),
      ],
    );
  }
}
