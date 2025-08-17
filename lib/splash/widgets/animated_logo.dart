import 'package:flutter/material.dart';
import 'package:trendify_app/helpers/function_helpers.dart';
import '../../core/constant/app_colors.dart';
import 'shopping_bags_logo.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with TickerProviderStateMixin {
  late final AnimationController _logoCtrl;
  late final AnimationController _textCtrl;

  late final Animation<double> _scale;
  late final Animation<double> _rotate;

  @override
  void initState() {
    super.initState();
    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.7, curve: Cubic(0.68, -0.55, 0.265, 1.55)),
      ),
    );
    _rotate = Tween<double>(begin: -3.14, end: 0).animate(
      CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutBack),
      ),
    );
    _textCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _logoCtrl.forward().whenComplete(() {
      _textCtrl.forward();
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _textCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _logoCtrl,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateZ(_rotate.value)
                  ..scale(_scale.value),
                child: child,
              );
            },
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: dark ? AppColors.black : AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const ShoppingBagsLogo(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
