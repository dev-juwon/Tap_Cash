import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {required this.context,
      required this.controller,
      this.keyboardType,
      required this.validate,
      this.hint,
      this.label,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscuringCharacter,
      this.style,
      this.color,
      this.borderSideColor,
      this.prefixColor,
      this.styleColor,
      this.focusNode,
      this.isClickable,
      this.isPassword,
      this.decoration,
      this.suffix,
      this.suffixPressed,
      this.prefix,
      this.maxLength,
      Key? key})
      : super(key: key);
  final BuildContext context;
  final FocusNode? focusNode;
  final Color? color;
  final Color? borderSideColor;
  final Color? styleColor;
  final Color? prefixColor;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?) validate;
  final String? hint;
  final String? label;
  final dynamic onTap;
  final dynamic onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? isPassword;
  final bool? isClickable;
  final InputDecoration? decoration;
  final IconData? suffix;
  final Widget? prefix;
  final Function? suffixPressed;
  final TextStyle? style;
  final String? obscuringCharacter;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: GoogleFonts.poppins(
        fontStyle: FontStyle.normal,
        color: styleColor ?? AppColors.primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      obscuringCharacter: obscuringCharacter ?? '*',
      controller: controller,
      validator: validate,
      enabled: isClickable ?? true,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: isPassword ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 32),
        fillColor: color,
        filled: true,
        prefixIcon: prefix != null
            ? Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 10),
                child: Text(
                  '+2',
                  style: GoogleFonts.poppins(
                      color: AppColors.greyColor, fontSize: 16.sp),
                ),
              )
            : null,
        prefixIconColor: prefixColor,
        suffixIcon: suffix != null
            ? IconButton(
                padding: const EdgeInsets.all(15.0).r,
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                  color: AppColors.greyColor,
                  size: 24.sp,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(15.0).r,
          ),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.greyColor,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.primaryColor,
          height: 1.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(15.0).r,
          ),
          borderSide: BorderSide(
            color: borderSideColor ?? AppColors.hintColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(15.0).r,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            const Radius.circular(15.0).r,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorStyle: GoogleFonts.poppins(color: Colors.red, fontSize: 12.sp),
      ),
    );
  }
}
