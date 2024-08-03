import 'package:flutter/material.dart';

import 'package:votar_attendance/constants/colors.dart';
import 'package:votar_attendance/helpers/navigation.dart';
import 'package:votar_attendance/helpers/responsive.dart';

class CustomSnackbar {
//

  static showSnackbar({
    required String msg,
    Color bgColor = AppColors.greenLight,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    return ScaffoldMessenger.of(Navigation.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        duration: duration,
        content: Text(
          msg,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12 * AppUI.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        action: action,
      ),
    );
  }
}
