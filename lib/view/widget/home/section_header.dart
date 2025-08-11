import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.onPressed,
    required this.textButton,
  });
  final String title;
  final VoidCallback? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.apply(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
