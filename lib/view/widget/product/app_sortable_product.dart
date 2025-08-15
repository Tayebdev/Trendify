import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constant/app_sizes.dart';
import '../home/grid_layout.dart';
import 'product_cart_vertical.dart';

class AppSortableProduct extends StatelessWidget {
  const AppSortableProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          items:
              [
                    "Name",
                    "Higher Price",
                    "Lower Price",
                    "Sale",
                    "Newest",
                    "Popularity",
                  ]
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
          onChanged: (value) {},
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        SizedBox(height: AppSizes.spaceBtwSections),
        GridLayout(
          mainAxisCount: 261.5,
          itemCount: 10,
          itemBuilder: (context, index) => ProductCartVertical(),
        ),
        SizedBox(height: AppSizes.spaceBtwSections / 2),
      ],
    );
  }
}
