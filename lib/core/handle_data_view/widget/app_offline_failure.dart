import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_images.dart';

class AppOfflineFailure extends StatefulWidget {
  const AppOfflineFailure({super.key});

  @override
  State<AppOfflineFailure> createState() => _AppOfflineFailureState();
}

class _AppOfflineFailureState extends State<AppOfflineFailure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.checkInternet, width: 200, height: 200),
            SizedBox(height: 30),
            Text("Whoops !", style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 15),
            Text(
              "No internet connection found.Check  your connection \n or try again.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
