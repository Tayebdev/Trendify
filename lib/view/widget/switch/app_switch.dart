import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({super.key, required this.onChanged});
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: true,
      onChanged: onChanged,
      activeColor: AppColors.primary,
      // ignore: deprecated_member_use
      activeTrackColor: AppColors.primary.withOpacity(0.5),
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.shade400,
    );
  }
}
