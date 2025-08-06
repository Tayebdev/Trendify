import 'package:flutter/material.dart';
import 'package:trendify_app/view/widget/button/elevated_button.dart';

import '../../../core/style/app_padding.dart';
import '../../widget/button/outlined_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UOutlinedButton(onPressed: () {}, child: Text("create count ")),
              UElevatedButton(onPressed: () {}, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
