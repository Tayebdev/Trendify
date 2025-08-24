import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_sizes.dart';
import 'package:trendify_app/core/functions/app_alert_exit.dart';
import '../../../core/style/app_padding.dart';
import '../../widget/login_signup/form_divider.dart';
import '../../widget/login_signup/form_login.dart';
import '../../widget/login_signup/header_login.dart';
import '../../widget/login_signup/social_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // ignore: deprecated_member_use
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppHeaderLogin(),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  AppFormLogin(),
                  SizedBox(height: AppSizes.spaceBtwSections / 2),
                  AppFormDivider(),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  AppSocialButton(),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return await AppAlertExit.alertExit(context);
        },
      ),
    );
  }
}
