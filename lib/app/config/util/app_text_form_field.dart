import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:storybook/app/config/constants/app_colors.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String hintText;
  final String? validator;
  final TextInputType? textInputType;
  final TextInputFormatter? inputFormatter;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? icon;
  final Widget? perfixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? isMobile;
  final Function(String)? onChanged;
  final Function()? onFieldSubmitted;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextAlign? textAlign;
  final Callback? ontap;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;

  const AppTextFormFieldWidget(
      {super.key,
      required this.hintText,
      this.label,
      this.validator,
      this.textInputType,
      this.inputFormatter,
      this.controller,
      this.suffixIcon,
      this.obscureText,
      this.icon,
      this.keyboardType,
      this.textInputAction,
      this.readOnly = false,
      this.maxLines,
      this.fontSize = 14,
      this.fontWeight,
      this.isMobile = true,
      this.onChanged,
      this.onFieldSubmitted,
      this.borderRadius,
      this.borderSide,
      this.textAlign = TextAlign.start,
      this.ontap,
      this.perfixIcon,
      this.focusNode,
      this.fillColor,
      this.hintStyle,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [inputFormatter ?? FilteringTextInputFormatter.deny('')],
      cursorColor: AppColors.kPrimaryColor,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText ?? false,
      onTap: ontap,
      style: style,
      validator: validator == null
          ? null
          : (String? val) {
              if (val!.isEmpty) {
                return validator;
              }
              return null;
            },
      readOnly: readOnly,
      onChanged: onChanged,
      onEditingComplete: onFieldSubmitted,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: perfixIcon,
        fillColor: fillColor ?? AppColors.kBackground,
        filled: true,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: borderSide ?? const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide ??
              const BorderSide(
                width: .5,
                color: Colors.grey,
              ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                context.width,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: borderSide ??
              BorderSide(
                width: 1,
                color: AppColors.kPrimaryColor,
              ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                context.width,
              ),
        ),
      ),
    );
  }
}
