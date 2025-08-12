import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/style/app_padding.dart';
import 'package:trendify_app/view/widget/appbar/appbar.dart';
import '../widget/home/grid_layout.dart';
import '../widget/product/product_cart_vertical.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Iconsax.add))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: GridLayout(
            itemCount: 10,
            mainAxisCount: 261.5,
            itemBuilder: (context, index) =>  ProductCartVertical(),
          ),
        ),
      ),
    );
  }
}
