import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:votar_attendance/helpers/responsive.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      enabled: enabled,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        isDense: true,
        label: Text(hintText),
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(fontSize: 12 * AppUI.sp),
      ),
    );
  }
}
