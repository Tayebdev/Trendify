import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/constant/app_images.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/view/widget/home/app_rounded_image.dart';
import 'package:trendify_app/view/widget/rounded_container/rounded_container.dart';
import '../../core/constant/app_texts.dart';
import '../widget/home/section_header.dart';
import '../widget/store/App_store_header.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              pinned: true,
              floating: true,
              flexibleSpace: Column(
                children: [
                  AppStoreHeader(),
                  SectionHeader(
                    title: AppTexts.brand,
                    onPressed: () {},
                    textButton: AppTexts.viewAll,
                  ),
                  AppRoundedContainer(
                    height: 80,
                    showBorder: true,
                    padding: EdgeInsets.all(AppSizes.sm),
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        AppRoundedImage(imageUrl: AppImages.brand),
                        Row(
                          children: [
                            Text(
                              "Bata",
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: AppSizes.xs),
                            Icon(
                              Iconsax.verify5,
                              color: AppColors.primary,
                              size: AppSizes.iconXs,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}

// class StoreView extends StatelessWidget {
//   const StoreView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               expandedHeight: 300,
//               pinned: true,
//               floating: true,
//               flexibleSpace: Column(
//                 children: [
//                   AppStoreHeader(),
//                   SectionHeader(
//                     title: AppTexts.brand,
//                     onPressed: () {},
//                     textButton: AppTexts.viewAll,
//                   ),
//                   AppRoundedContainer(
//                     height: 80,
//                     showBorder: true,
//                     padding: EdgeInsets.all(AppSizes.sm),
//                     backgroundColor: Colors.transparent,
//                     child: Row(
//                       children: [
//                         AppRoundedImage(imageUrl: AppImages.brand),
//                         SizedBox(width: AppSizes.spaceBtwItems / 2),
//                         BrandTitleWithIcon(title: "Bata",),
//                         // Text("172 Product",
//                         // style: Theme.of(context).textTheme.labelMedium,
//                         // overflow: TextOverflow.ellipsis,)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ];
//         },
//         body: Container(),
//       ),
//     );
//   }
// }

