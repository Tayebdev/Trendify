import 'package:flutter/material.dart';
import 'package:trendify_app/view/widget/setting/app_curved_edges_widget.dart';


class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // UAppBar(
            //   showBackArrow: true,
            //   actions: [
            //     IconButton(onPressed: () {}, icon: Icon(Iconsax.heart)),
            //   ],
            // ),
            AppCurvedEdgesWidget()
          ],
        ),
      ),
    );
  }
}
