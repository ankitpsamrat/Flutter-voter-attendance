import 'package:flutter/material.dart';
import 'package:votar_attendance/helpers/responsive.dart';

class CustomSwitch extends StatelessWidget {
  final String title;
  final double? titleSize;
  final bool value;
  final void Function(bool)? onChanged;

  const CustomSwitch({
    super.key,
    required this.title,
    this.titleSize,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 14 * AppUI.sp,
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
