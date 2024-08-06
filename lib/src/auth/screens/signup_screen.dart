import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../helpers/navigation.dart';
import '../../../helpers/responsive.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12 * AppUI.dh,
                bottom: 6 * AppUI.dh,
              ),
              child: Image.asset(
                AppImgs.loginImg,
                height: 30 * AppUI.dh,
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 12 * AppUI.sp),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                hintText: 'Enter your email',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3 * AppUI.dh, bottom: 8 * AppUI.dh),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12 * AppUI.sp),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  hintText: 'Enter your password',
                ),
              ),
            ),
            SizedBox(
              height: 6 * AppUI.dh,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigation.navigatorKey.currentState!.push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomeScreen(),
                  //   ),
                  // );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.active,
                  foregroundColor: AppColors.white,
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15 * AppUI.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2 * AppUI.dh),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12 * AppUI.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  const TextSpan(text: 'Already have an account?  '),
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: AppColors.active,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.active,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigation.navigatorKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
