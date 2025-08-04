import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import '../widget/onboarding_widget/oboarding_next_button.dart';
import '../widget/onboarding_widget/onboarding_dot_navigation.dart';
import '../widget/onboarding_widget/onboarding_page.dart';
import '../widget/onboarding_widget/onboarding_skip_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Stack(
          children: [
            OnboardingSkipButton(),
            OnboardingPageView(),
            OnboardingDotNavigation(),
            OboardingNextButton(),
          ],
        ),
      ),
    );
  }
}
