import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../helpers/function_helpers.dart';
import '../../widget/rounded_container/rounded_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      showBorder: true,
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.white,
      padding: EdgeInsets.all(AppSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Have a promo code? Enter here',
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: AppHelperFunctions.isDarkMode(context)
                    // ignore: deprecated_member_use
                    ? AppColors.white.withOpacity(0.5)
                    // ignore: deprecated_member_use
                    : AppColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.1),
                side: BorderSide(
                  // 🔹 Border color & width
                  color: AppHelperFunctions.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.grey,
                  width: 1.4,
                ),
              ),
              child: Text("Applay"),
            ),
          ),
        ],
      ),
    );
  }
}
