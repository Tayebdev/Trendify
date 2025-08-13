import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';

import '../../widget/appbar/appbar.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: Icon(Iconsax.add,size: AppSizes.iconLg,),
      ),
      appBar: UAppBar(showBackArrow: true, title: Text("Addresses")),
      body: Center(child: Text("data")),
    );
  }
}
