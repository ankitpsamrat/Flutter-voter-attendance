import 'package:flutter/material.dart';

import 'helpers/navigation.dart';
import 'src/auth/screens/login_screen.dart';

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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          // backgroundColor: AppColors.orange.withOpacity(0.8),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
