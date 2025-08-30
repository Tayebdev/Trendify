import 'package:flutter/material.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';
import 'package:trendify_app/view/widget/circular_contianer/circular_container.dart';

import '../../../core/constant/app_colors.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = AppHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? AppColors.white : null),
      avatar: isColor
          ? CircularContainer(
              width: 50,
              height: 50,
              backgroundColor: AppHelperFunctions.getColor(text)!,
            )
          : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      padding: isColor ? EdgeInsets.all(0) : null,
      shape: isColor ? CircleBorder() : null,
      backgroundColor: isColor ? AppHelperFunctions.getColor(text) : null,
    );
  }
}
