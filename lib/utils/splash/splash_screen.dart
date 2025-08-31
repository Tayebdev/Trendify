import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import '../../core/services/app_services.dart';
import '../../navigation_menu.dart';
import '../../view/screen/onboarding_view.dart';
import 'widgets/animated_app_name.dart';
import 'widgets/animated_logo.dart';
import 'widgets/animated_spinner.dart';
import 'widgets/animated_tagline.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final AppServices appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: _buildSplashContent(context),
      splashIconSize: double.infinity,
      backgroundColor: Colors.transparent,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: appServices.sharedPref.getBool('isLoggedIn') == false
          ? OnboardingView()
          : NavigationMenu(),
    );
  }

  Widget _buildSplashContent(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: dark ? AppColors.black : AppColors.white,
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
