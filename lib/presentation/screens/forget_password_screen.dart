import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                      color: AppColors.greenColor,
                    ),
                  ),
                ),
                Space(height: 15.h, width: 0),
                FittedBox(
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.imagesForgotPassword, fit: BoxFit.fill),
                Space(height: 15.h, width: 0),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    color: AppColors.hintColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: phoneController,
                  validator: (String? value) {
                    if (value!.isEmpty || value.length < 11) {
                      return 'Please Enter a Valid Number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 20, bottom: 20, left: 32),
                    fillColor: const Color(0xFFF6FEF9),
                    filled: true,
                    suffixIcon: Icon(
                      Icons.check_box_outlined,
                      color: const Color(0xFF92E3A9),
                      size: 24.sp,
                    ),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: const Color(0xFF344054),
                      height: 1.h,
                    ),
                    focusedBorder: InputBorder.none,
                  ),
                ),
                Space(height: 21.h, width: 0),
                defaultMaterialButton(
                  function: () {
                    if (formKey.currentState!.validate()) {
                      //  navigateTo(context, const OtpScreen());
                    }
                  },
                  text: 'Send',
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
