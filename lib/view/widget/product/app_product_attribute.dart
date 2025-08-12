import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/view/widget/home/section_header.dart';

class AppProductAttribute extends StatelessWidget {
  const AppProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.spaceBtwItems/2,),
        SectionHeader(title: "Colors",showButton:false),
        SizedBox(height: AppSizes.spaceBtwItems/2,),
        ChoiceChip(label: Text("Green"), selected: true,onSelected: (value) {
          
        },)
      ],
    );
  }
}