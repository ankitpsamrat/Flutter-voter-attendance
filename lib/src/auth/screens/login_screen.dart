import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../helpers/navigation.dart';
import '../../../helpers/responsive.dart';
import '../../common/custom_button.dart';
import '../../common/custom_snackbar.dart';
import '../../common/custom_text_field.dart';
import '../../home/screens/home_screen.dart';
import '../models/user_info_model.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showBtnLoader = false;
  bool _showPassword = false;
  UserInfoModel? _userInfo;

  Future<void> _userLoginMethod({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://166.0.242.94:80/voterattendence/users/User-Login?login.username=$userName&login.password=$password'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YXBpa2V5Om1ldXNhbTEyIw==',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _userInfo = UserInfoModel.fromJson(data);
        });

        CustomSnackbar.showSnackbar(msg: 'Login successfully!');
        Navigation.navigatorKey.currentState!.push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userInfo: _userInfo!,
            ),
          ),
        );
      } else {
        CustomSnackbar.showSnackbar(
          msg: 'Invalid user cridential',
          bgColor: AppColors.red,
        );
        throw Exception('Invalid user cridential');
      }
    } catch (e) {
      debugPrint('Unable to validate user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * AppUI.dw),
          child: Form(
            key: _formKey,
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
                CustomTextField(
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required*';
                    }
                    return null;
                  },
                  hintText: 'Enter username',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3 * AppUI.dh),
                  child: CustomTextField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required*';
                      }
                      return null;
                    },
                    obscureText: !_showPassword,
                    hintText: 'Enter password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigation.navigatorKey.currentState!.push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 12 * AppUI.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 6 * AppUI.dh,
                    bottom: 2 * AppUI.dh,
                  ),
                  child: CustomButton(
                    title: 'Login',
                    titleColor: AppColors.black,
                    bgColor: AppColors.greenLight,
                    showLoader: _showBtnLoader,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _showBtnLoader = true;
                        });

                        await _userLoginMethod(
                          userName: _userNameController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                        setState(() {
                          _showBtnLoader = false;
                        });
                      }
                    },
                  ),
                ),
                // RichText(
                //   text: TextSpan(
                //     style: TextStyle(
                //       fontSize: 12 * AppUI.sp,
                //       color: AppColors.black,
                //       fontWeight: FontWeight.w600,
                //     ),
                //     children: [
                //       const TextSpan(text: 'Don\'t have an account?  '),
                //       TextSpan(
                //         text: 'Sign up',
                //         style: const TextStyle(
                //           color: AppColors.active,
                //           decoration: TextDecoration.underline,
                //           decorationColor: AppColors.active,
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () {
                //             Navigation.navigatorKey.currentState!.push(
                //               MaterialPageRoute(
                //                 builder: (context) => const SignUpScreen(),
                //               ),
                //             );
                //           },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
