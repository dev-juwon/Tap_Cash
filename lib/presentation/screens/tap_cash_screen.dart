import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/components/text_form_field.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';

class TapCashScreen extends StatelessWidget {
  const TapCashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    TextEditingController pinCodeController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(16.0).r,
          child: InkWell(
            onTap: () {
              pop(context);
            },
            child: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                Assets.imagesArrowBack,
                height: 40.h,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          'Money Transfer',
          style: GoogleFonts.poppins(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Recipient name',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: phoneController,
                  keyboardType: TextInputType.name,
                  hint: '',
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'An Egyptian phone number consisting of 11 digits';
                    }
                    return null;
                  },
                ),
                const Space(height: 20, width: 0),
                Text(
                  'Reason of transfer',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: amountController,
                  keyboardType: TextInputType.text,
                  hint: '',
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'An integer number\ngreater than or equal\nto 50 and not more\nthan 30,000';
                    }
                    return null;
                  },
                ),
                const Space(height: 20, width: 0),
                Text(
                  'Card number',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: pinCodeController,
                  keyboardType: TextInputType.number,
                  hint: '',
                  validate: (String? value) {
                    if (value!.trim().isEmpty || value.trim().length < 14) {
                      return 'Uppercase and lowercase letters, numbers and signs, and not less than 8 letters';
                    }
                    return null;
                  },
                ),
                Text(
                  'Expiry year',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hint: '',
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'An Egyptian phone number consisting of 11 digits';
                    }
                    return null;
                  },
                ),
                const Space(height: 20, width: 0),
                Text(
                  'Expiry month',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hint: '',
                  validate: (String? value) {
                    if (value!.isEmpty || value.length < 11) {
                      return 'An Egyptian phone number consisting of 11 digits';
                    }
                    return null;
                  },
                ),
                const Space(height: 20, width: 0),
                Text(
                  'Card holder (sender name)',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hint: '',
                  validate: (String? value) {
                    if (value!.isEmpty || value.length < 11) {
                      return 'An Egyptian phone number consisting of 11 digits';
                    }
                    return null;
                  },
                ),
                const Space(height: 20, width: 0),
                Text(
                  'Cvv',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const Space(height: 16, width: 0),
                DefaultTextFormField(
                  context: context,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hint: '',
                  validate: (String? value) {
                    if (value!.isEmpty ||
                        value.length < 3 ||
                        value.length > 3) {
                      return 'An Egyptian phone number consisting of 11 digits';
                    }
                    return null;
                  },
                ),
                const Space(height: 32, width: 0),
                Container(
                  padding: const EdgeInsets.all(29),
                  alignment: Alignment.center,
                  width: 359,
                  height: 145,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Transfer instructions',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor),
                      ),
                      const Space(height: 8, width: 0),
                      Text(
                        'Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF475467),
                        ),
                      ),
                    ],
                  ),
                ),
                const Space(height: 32, width: 0),
                defaultMaterialButton(
                  function: () {
                    if (formKey.currentState!.validate()) {}
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
