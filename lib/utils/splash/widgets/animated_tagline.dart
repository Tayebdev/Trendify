import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class AnimatedTagline extends StatefulWidget {
  const AnimatedTagline({super.key});

  @override
  AnimatedTaglineState createState() => AnimatedTaglineState();
}

class AnimatedTaglineState extends State<AnimatedTagline>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _offset;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _offset = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _opacity = Tween<double>(begin: 0, end: 0.9).animate(_ctrl);
    Future.delayed(const Duration(milliseconds: 1200), () => _ctrl.forward());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _opacity,
        child: const Text(
          'happy shop',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.primary,
            letterSpacing: 2,
            shadows: [Shadow(blurRadius: 8, color: AppColors.primary)],
          ),
        ),
      ),
    );
  }
}
