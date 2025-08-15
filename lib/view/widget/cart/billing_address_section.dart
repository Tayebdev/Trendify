import 'package:flutter/material.dart';

import '../../../core/constant/app_sizes.dart';
import '../home/section_header.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: "Shopping Address",
                textButton: "Change",
                onPressed: () {},
              ),
              Text(
                "Coding with T",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.grey, size: 16),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Text(
                    "(+213) 777-342252",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Row(
                children: [
                  Icon(Icons.location_history, color: Colors.grey, size: 16),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Text(
                    "South liana, Maine 852564, USA",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
            ],
          
    );
  }
}
