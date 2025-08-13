import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/view/widget/choice_chip/app_choice_chip.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

class AppProductAttribute extends StatelessWidget {
  const AppProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        SectionHeader(title: "Colors", showButton: false),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        Column(
          children: [
            Wrap(
              spacing: 6,
              children: [
                AppChoiceChip(text: 'Green', selected: true),
                AppChoiceChip(text: 'Blue', selected: false),
                AppChoiceChip(text: 'Teal', selected: false),
                AppChoiceChip(text: 'Green', selected: false),
                AppChoiceChip(text: 'Blue', selected: false),
                AppChoiceChip(text: 'Teal', selected: false),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        SectionHeader(title: "Sizes", showButton: false),
        SizedBox(height: AppSizes.spaceBtwItems / 2),
        Column(
          children: [
            Wrap(
              spacing: 6,
              children: [
                AppChoiceChip(text: 'EU 34', selected: true),
                AppChoiceChip(text: 'EU 35', selected: false),
                AppChoiceChip(text: 'EU 36', selected: false),
                AppChoiceChip(text: 'EU 37', selected: false),
                AppChoiceChip(text: 'EU 38', selected: false),
                AppChoiceChip(text: 'EU 39', selected: false),
              ],
            ),
          ],
        ),

      ],
    );
  }
}
