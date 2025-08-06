import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  IconData? icon;
  String? text;
  TextEditingController? textEditingController;
  bool? value;
  AppTextField({
    super.key,
    required this.icon,
    required this.text,
    required this.textEditingController,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.primary,
      obscureText: value == false ? false : true,
      decoration: InputDecoration(labelText: text, prefixIcon: Icon(icon)),
    );
  }
}
