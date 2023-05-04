import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:tap_cash/core/app_color/app_color.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/generated/assets.dart';

class OtpAuthenticationsScreen extends StatelessWidget {
  const OtpAuthenticationsScreen({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      Assets.imagesArrowBack,
                      height: 20.h,
                    ),
                  ),
                ),
                Space(height: 15.h, width: 0),
                FittedBox(
                  child: Text(
                    'Entre OTP Code',
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.imagesOtp, fit: BoxFit.fill),
                Pinput(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Digit Code';
                    } else if (value.length < 4) {
                      return 'Please Enter a valid Digit Code';
                    } else {
                      return null;
                    }
                  },
                  defaultPinTheme: PinTheme(
                      width: 73,
                      height: 73,
                      textStyle: GoogleFonts.poppins(
                          fontSize: 20,
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                Space(height: 85.h, width: 0),
                defaultMaterialButton(
                  function: () {
                    if (formKey.currentState!.validate()) {
                      /// TODO: Is True? Navigate To Home Screen
                    }
                  },
                  text: 'Confirm',
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
