import 'package:flutter/material.dart';

import 'app_rating_progress_indicator.dart';

class AppOverallProductRating extends StatelessWidget {
  const AppOverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return             Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "4.2",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      AppRatingProgressIndicator(text: '5', value: 1),
                      AppRatingProgressIndicator(text: '4', value: 0.8),
                      AppRatingProgressIndicator(text: '3', value: 0.6),
                      AppRatingProgressIndicator(text: '2', value: 0.4),
                      AppRatingProgressIndicator(text: '1', value: 0.2),
                    ],
                  ),
                ),
              ],
            );
  }
}