import 'package:flutter/material.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../../widget/product/app_sortable_product.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(title: Text("Popular Products"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child:AppSortableProduct(),
        ),
      ),
    );
  }
}
