import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_texts.dart';
import '../../../utils/helpers/function_helpers.dart';

class AppFormDivider extends StatelessWidget {
  const AppFormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.8,
            color: dark ? AppColors.darkGrey : AppColors.black,
          ),
        ),
        Text(
          AppTexts.orSignInWith,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            thickness: 0.8,
            color: dark ? AppColors.darkGrey : AppColors.black,
          ),
        ),
      ],
    );
  }
}
