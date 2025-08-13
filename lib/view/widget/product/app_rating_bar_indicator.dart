import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_colors.dart';

class AppRatingBarIndicator extends StatelessWidget {
  const AppRatingBarIndicator({super.key,required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, value) {
        return Icon(Iconsax.star1, color: AppColors.primary);
      },
      rating: rating,
      itemSize: 20,
      unratedColor: AppColors.darkGrey,
    );
  }
}
