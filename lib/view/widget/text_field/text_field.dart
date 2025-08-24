import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  IconData? icon;
  String? text;
  TextEditingController? textEditingController;
  bool? value;
  bool? textInputPhone;
  String? Function(String?)? validator;
  AppTextField({
    super.key,
    required this.icon,
    required this.text,
    required this.textEditingController,
    required this.validator,
    this.value,
    this.textInputPhone=false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:textInputPhone==true ?  TextInputType.phone :TextInputType.text,
      controller: textEditingController,
      validator: validator,
      cursorColor: AppColors.primary,
      obscureText: value == false ? false : true,
      decoration: InputDecoration(labelText: text, prefixIcon: Icon(icon)),
    );
  }
}
