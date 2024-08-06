import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonUtils {
  //

  // static String formattedDate(DateTime date) {
  //   return DateFormat.yMMMd().add_jm().format(date);
  // }

  static String textLength(String text, int maxLength) {
    return text.length > maxLength
        ? "${text.substring(0, maxLength)}..."
        : text;
  }

  static Future<void> launchEmail({required String email}) async {
    try {
      final Uri uri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Need help!'},
      );
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      debugPrint('Unable to launch email: $e');
    }
  }
}
