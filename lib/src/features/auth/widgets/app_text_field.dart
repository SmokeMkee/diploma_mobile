import 'package:diploma_mobile/constants/app_colors.dart';
import 'package:diploma_mobile/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.hintStyle,
    this.validator,
    this.obscureText = false,
    this.textEditingController,
    this.focusNode,
    this.onChange,
    this.errorText,
  });

  final String? errorText;
  final Widget? prefixIcon;
  final Function(String)? onChange;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.gray200,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.error,
      ),
    );
    return TextFormField(
      onChanged: onChange,
      focusNode: focusNode,
      style: AppStyles.s15w400,
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        errorText: errorText,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onSaved: (val) => textEditingController?.text = val ?? '',
    );
  }
}
