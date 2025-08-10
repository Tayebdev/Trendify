import 'package:flutter/material.dart';
import '../../../core/constant/app_sizes.dart';
import '../home/app_rounded_image.dart';
import '../rounded_container/rounded_container.dart';
import 'brand_title_with_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.title,
    required this.numberProduct,
    required this.imageUrl,
  });
  final String title, numberProduct, imageUrl;

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      height: 80,
      showBorder: true,
      padding: EdgeInsets.all(AppSizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          AppRoundedImage(imageUrl: imageUrl),
          SizedBox(width: AppSizes.spaceBtwItems / 2),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithIcon(title: title),
              Text(
                numberProduct,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
