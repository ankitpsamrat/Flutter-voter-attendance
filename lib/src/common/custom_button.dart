import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/responsive.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color bgColor;
  final bool showLoader;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.title,
    this.titleColor = AppColors.white,
    this.bgColor = AppColors.blue,
    this.showLoader = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6 * AppUI.dh,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: showLoader ? null : onTap,
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          foregroundColor: AppColors.white,
        ),
        child: showLoader
            ? const Padding(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator(strokeWidth: 5),
              )
            : Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15 * AppUI.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
