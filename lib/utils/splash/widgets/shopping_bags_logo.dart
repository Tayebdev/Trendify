import 'package:flutter/material.dart';

import '../../../core/constant/app_images.dart';

class ShoppingBagsLogo extends StatelessWidget {
  const ShoppingBagsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Container(
            child: Image.asset(AppImages.logo),
          )
        ],
      ),
    );
  }
}