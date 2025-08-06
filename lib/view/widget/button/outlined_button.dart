import 'package:flutter/material.dart';

import '../../../helpers/device_helpers.dart';

class UOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const UOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UDeviceHelper.getScreenWidth(context),
      child: OutlinedButton(onPressed: onPressed, child: child),
    );
  }
}
