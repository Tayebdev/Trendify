import 'package:flutter/material.dart';
import 'app_custom_curved_edges.dart';

class AppCurvedEdgesWidget extends StatelessWidget {
  const AppCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: AppCustomCurvedEdges(), child: child);
  }
}
