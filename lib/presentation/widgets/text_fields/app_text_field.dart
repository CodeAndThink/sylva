import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppTextField extends StatelessWidget {
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
  final int? maxLines;
  final bool isEnable;

  const AppTextField({
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
    this.maxLines = 1,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      style: theme.textTheme.bodyMedium,
      focusNode: focusNode,
      maxLines: maxLines,
      enabled: isEnable,
      decoration: InputDecoration(
        errorMaxLines: 10,
        errorStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.error,
        ),
        labelText: labelText,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: AppColors.placeholderText,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: theme.colorScheme.primary, size: 20)
            : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: 16.borderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: 16.borderRadius,
          borderSide: BorderSide(color: theme.colorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 16.borderRadius,
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: 16.borderRadius,
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: 16.borderRadius,
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
        ),
        filled: true,
        fillColor:
            filledColor ??
            (theme.brightness == Brightness.dark
                ? theme.colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.4,
                  )
                : AppColors.placeholderBackground),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
