import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/constant/app_colors.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OtpTextField(
          cursorColor: AppColors.white,
          disabledBorderColor: Colors.green,
          borderRadius: BorderRadius.circular(10),
          focusedBorderColor: Colors.deepOrangeAccent,
          numberOfFields: 4,
          fieldHeight: 120,
          fieldWidth: 20,
          borderColor: Colors.yellowAccent,
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          // onCodeChanged: (String code) {
          // print(code);
          // },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {}, // end onSubmit
        ),
      ),
    );
  }
}
