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
    this.showBorder = true,
    required this.onTap,
    this.width = AppSizes.brandCardWidth,
  });
  final String title, numberProduct, imageUrl;
  final bool showBorder;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppRoundedContainer(
        width: width,
        height: AppSizes.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(AppSizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: AppRoundedImage(
                isNetworkImage: true,
                imageUrl: imageUrl,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithIcon(title: title),
                  SizedBox(height: AppSizes.sm),
                  Text(
                    numberProduct,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
