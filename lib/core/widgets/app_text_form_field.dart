// ignore_for_file: use_key_in_widget_constructors

import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  //final TextEditingController controller;
  final String text;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardtype;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    //  required this.controller,
    required this.text,
    this.obscureText,
    this.suffixIcon,
    this.keyboardtype,
    this.labelStyle,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardtype ?? TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: labelStyle ?? TextStyles.font32darkGreenBold,
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
