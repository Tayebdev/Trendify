import 'package:flutter/material.dart';
import 'package:trendify_app/helpers/function_helpers.dart';

import '../../core/constant/app_colors.dart';

class AnimatedAppName extends StatefulWidget {
  @override
  _AnimatedAppNameState createState() => _AnimatedAppNameState();
}

class _AnimatedAppNameState extends State<AnimatedAppName>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _offset;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _offset = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
    _opacity = Tween<double>(begin: 0, end: 1).animate(_ctrl);
    Future.delayed(const Duration(milliseconds: 800), () => _ctrl.forward());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _opacity,
        child: Text(
          'Trendify',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: dark ? AppColors.white : AppColors.black,
            letterSpacing: 3,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: dark ? Colors.black54 : Colors.white54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
