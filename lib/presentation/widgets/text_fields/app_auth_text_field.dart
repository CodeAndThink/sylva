import 'package:flutter/material.dart';

import 'app_text_field.dart';

class AppAuthTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool autofocus;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Color? filledColor;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool isEnable;

  const AppAuthTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.filledColor,
    this.obscureText = false,
    this.focusNode,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      prefixIcon: prefixIcon ?? Icons.mail,
      suffixIcon: suffixIcon,
      validator: validator,
      onChanged: onChanged,
      filledColor: filledColor,
      obscureText: obscureText,
      focusNode: focusNode,
      isEnable: isEnable,
    );
  }
}
