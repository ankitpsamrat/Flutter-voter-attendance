import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constants/colors.dart';
import '../../common/custom_snackbar.dart';

class VoterServices {
  //

  Future<void> deleteReminder({required int reminderID}) async {
    try {
      final response = await http.post(
        Uri.parse('http://166.0.242.94:80/api/reminderItems/delete'),
        body: jsonEncode({'reminderId': reminderID}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YXBpa2V5Om1ldXNhbTEyIw==',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        CustomSnackbar.showSnackbar(
          msg: 'Reminder deleted!',
          duration: const Duration(seconds: 1),
        );
      } else {
        CustomSnackbar.showSnackbar(
          msg: 'Failed to delete reminder',
          bgColor: AppColors.red,
          duration: const Duration(seconds: 1),
        );
        throw Exception('Failed to delete reminder');
      }
    } catch (e) {
      debugPrint('Unable to delete reminder: $e');
    }
  }
}
