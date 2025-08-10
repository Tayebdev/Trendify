import 'package:flutter/material.dart';

import '../../../core/constant/app_sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainAxisCount,
      ),
      itemBuilder: (context, index) {
        return itemBuilder(context, index);
      },
    );
  }
}
