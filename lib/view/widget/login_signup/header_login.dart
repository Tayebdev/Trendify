import 'package:flutter/material.dart';

import '../../../core/constant/app_sizes.dart';
import '../../../core/constant/app_texts.dart';

class AppHeaderLogin extends StatelessWidget {
  const AppHeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: AppSizes.sm),
        Text(AppTexts.loginSubTitle),
      ],
    );
  }
}
