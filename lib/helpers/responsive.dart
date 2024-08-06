import 'package:flutter/widgets.dart';

import 'navigation.dart';

class AppUI {
  static double dh =
      MediaQuery.of(Navigation.navigatorKey.currentContext!).size.height / 100;

  static double dw =
      MediaQuery.of(Navigation.navigatorKey.currentContext!).size.width / 100;

  static double sp = dw / 3.0;
}
