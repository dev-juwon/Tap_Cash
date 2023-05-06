import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:tap_cash/controller/sign_up_cubit.dart';
import 'package:tap_cash/controller/sign_up_state.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/show_toast.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/network/app_constant.dart';
import 'package:tap_cash/core/network/cache_helper.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/presentation/screens/layout_screen.dart';

class OtpAuthenticationsScreen extends StatelessWidget {
  const OtpAuthenticationsScreen({Key? key,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.nationalID,
    required this.expirationDate,
    required this.dateOfBirth})
      : super(key: key);
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String password;
  final String nationalID;
  final String expirationDate;
  final String dateOfBirth;

  @override
  Widget build(BuildContext context) {
    TextEditingController validationCode = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            if (state.userModel.status!) {
              showToast(
                text: state.userModel.message!,
                state: ToastStates.success,
              );
              if (kDebugMode) {
                print(state.userModel.message);
              }
              if (kDebugMode) {
                print(state.userModel.token);
              }

              CacheHelper.saveData(key: "token", value: state.userModel.token)
                  .then((value) {
                uId = state.userModel.token;
                navigateAndFinish(context, const HomeLayout());
              });
            } else {
              showToast(
                text: state.userModel.message!,
                state: ToastStates.error,
              );
              if (kDebugMode) {
                print(state.userModel.message);
              }
            }
          }
        },
        builder: (context, state) {
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
                        length: 6,
                        controller: validationCode,
                        validator: (String? value) {
                          if (value!.trim().isEmpty ||
                              value.trim().length < 6) {
                            return 'A real 6-digit verification number that does not expire';
                          }
                          return null;
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
                            SignUpCubit.get(context).userSignUp(
                              phoneNumber: phoneNumber,
                              firstName: firstName,
                              lastName: lastName,
                              password: password,
                              nationalID: nationalID,
                              expirationDate: expirationDate,
                              dateOfBirth: dateOfBirth,
                              validationCode: validationCode.text,
                            );
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
        },
      ),
    );
  }
}
