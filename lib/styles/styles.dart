import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    color: AppColors.textColor,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 16.0,
    color: AppColors.hintTextColor,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

class AppStyles {
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardColor,
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10.0,
        offset: const Offset(0, 5),
      ),
    ],
  );

  static InputDecoration inputDecoration({String? hintText, IconData? icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.hint,
      prefixIcon: icon != null ? Icon(icon, color: AppColors.iconColor) : null,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.dividerColor),
      ),
      filled: true,
      fillColor: AppColors.backgroundColor,
    );
  }
}
