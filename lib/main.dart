import 'package:flutter/material.dart';
import 'package:votar_attendance/helpers/navigation.dart';
import 'package:votar_attendance/src/auth/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voter attendance',
      navigatorKey: Navigation.navigatorKey,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     elevation: 0,
      //     centerTitle: true,
      //     surfaceTintColor: AppColors.transparent,
      //     backgroundColor: AppColors.orange.withOpacity(0.8),
      //   ),
      // ),
      home: const LoginScreen(),
    );
  }
}
