import 'package:flutter/material.dart';
import 'package:votar_attendance/constants/colors.dart';
import 'package:votar_attendance/helpers/responsive.dart';
import 'package:votar_attendance/src/common/custom_button.dart';
import 'package:votar_attendance/src/common/custom_snackbar.dart';
import 'package:votar_attendance/src/common/custom_text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                // AppImgs.forgotPassword,
                'https://www.creativefabrica.com/wp-content/uploads/2022/07/13/forgot-password-Icon-Illustration-vector-Graphics-34103199-1.jpg',
                height: 30 * AppUI.dh,
                width: 100 * AppUI.dw,
              ),
              Text(
                'Reset password',
                style: TextStyle(
                  fontSize: 16 * AppUI.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Please enter the email address linked to your account. we\'ll send you a new password.',
                style: TextStyle(
                  fontSize: 10 * AppUI.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3 * AppUI.dh),
                child: const CustomTextField(
                  hintText: 'Enter your email',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 6 * AppUI.dh,
                  bottom: 2 * AppUI.dh,
                ),
                child: CustomButton(
                  title: 'Submit',
                  bgColor: AppColors.active,
                  onTap: () {
                    CustomSnackbar.showSnackbar(
                      msg: 'Please check your email for new password!',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
