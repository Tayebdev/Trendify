import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constant/app_images.dart';

class AppServerFailure extends StatefulWidget {
  const AppServerFailure({super.key});

  @override
  State<AppServerFailure> createState() => _AppServerFailureState();
}

class _AppServerFailureState extends State<AppServerFailure> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImages.serverFailure, width: 350, height: 350),
          SizedBox(height: 30),
          Text(
            "Server down !",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 15),
          Text(
            "it looks like the app server is down. please try \n  after sometime.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
