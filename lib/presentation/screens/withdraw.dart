import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/controller/tap_cash_cubit.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/components/text_form_field.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';

class WithDrawScreen extends StatelessWidget {
  const WithDrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController bankAccountNumberController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<TapCashCubit, TapCashState>(
      listener: (context, state) {},
      builder: (context, state) {
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
              'Withdraw',
              style: GoogleFonts.poppins(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Deposit your wallet',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Space(height: 16, width: 0),
                  DefaultTextFormField(
                    context: context,
                    controller: bankAccountNumberController,
                    keyboardType: TextInputType.phone,
                    hint: '01234567892',
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 14) {
                        return 'An Egyptian phone number consisting of 11 digits';
                      }
                      return null;
                    },
                  ),
                  const Space(height: 20, width: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Enter the amount\nyou want',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const Space(height: 0, width: 20),
                      Expanded(
                        child: DefaultTextFormField(
                          context: context,
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          hint: '5000',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'An integer number\ngreater than or equal\nto 50 and not more\nthan 30,000';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const Space(height: 20, width: 0),
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Space(height: 16, width: 0),
                  DefaultTextFormField(
                    context: context,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hint: 'Tap12345@',
                    validate: (String? value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.trim().isEmpty ||
                          value.trim().length < 8 ||
                          !regex.hasMatch(value)) {
                        return 'Uppercase and lowercase letters, numbers and signs, and not less than 8 letters';
                      }
                      return null;
                    },
                  ),
                  const Space(height: 32, width: 0),
                  defaultMaterialButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        TapCashCubit.get(context).withDraw(
                          amount: amountController.text,
                          bankAccountNumber: bankAccountNumberController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    text: 'Deposit',
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
