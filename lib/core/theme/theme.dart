import 'package:flutter/material.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import 'package:trendify_app/core/theme/theme_widgets/app_theme.dart';
import 'package:trendify_app/core/theme/theme_widgets/bottom_sheet_theme.dart';
import 'package:trendify_app/core/theme/theme_widgets/chip_theme.dart';
import 'theme_widgets/checkbox_theme.dart';
import 'theme_widgets/outlined_button_theme.dart';
import 'theme_widgets/text_field_theme.dart';
import 'theme_widgets/text_theme.dart';
import 'theme_widgets/elevated_button_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    disabledColor: AppColors.grey,
    textTheme: AppTextTheme.lightTextTheme,
    scaffoldBackgroundColor: AppColors.light,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: UAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    disabledColor: AppColors.grey,
    textTheme: AppTextTheme.darkTextTheme,
    scaffoldBackgroundColor: AppColors.black,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: UAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: AppChipTheme.darkChipTheme,
  );
}
