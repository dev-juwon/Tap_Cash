import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/controller/otp_cubit.dart';
import 'package:tap_cash/controller/sign_up_cubit.dart';
import 'package:tap_cash/controller/sign_up_state.dart';
import 'package:tap_cash/core/app_color/app_color.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/show_toast.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/components/text_form_field.dart';
import 'package:tap_cash/core/network/app_constant.dart';
import 'package:tap_cash/core/network/cache_helper.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/presentation/screens/otp_authentications_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController nationalIdController = TextEditingController();
    TextEditingController expirationDateController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
    TextEditingController passWordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // if (state is SignUpSuccessState) {
          //   if (state.userModel.status!) {
          //     showToast(
          //       text: state.userModel.message!,
          //       state: ToastStates.success,
          //     );
          //     print(state.userModel.message);
          //     print(state.userModel.data!.token);
          //
          //     CacheHelper.saveData(
          //         key: "token", value: state.userModel.data!.token)
          //         .then((value) {
          //       AppConstant.uId = state.userModel.data!.token!;
          //       //navigateAndFinish(context, HomeScreen());
          //     });
          //   } else {
          //     showToast(
          //       text: state.userModel.message!,
          //       state: ToastStates.error,
          //     );
          //     print(state.userModel.message);
          //   }
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 167.h,
              leading: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                      height: 175.h,
                      width: double.infinity,
                      color: const Color(0xFFD4EEDD),
                      child: SvgPicture.asset(Assets.imagesLoginBackGround)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 12),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                            color: AppColors.primaryColor,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0).r,
                    child: InkWell(
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
                  ),
                ],
              ),
              leadingWidth: double.infinity,
            ),
            body: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'First Name',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: firstNameController,
                                      keyboardType: TextInputType.name,
                                      hint: 'First Name',
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter a First Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                const Space(height: 12, width: 0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Last Name',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: lastNameController,
                                      keyboardType: TextInputType.name,
                                      hint: 'Last Name',
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter a Last Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                const Space(height: 12, width: 0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Phone Number',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
                                      hint: 'Phone Number',
                                      validate: (String? value) {
                                        if (value!.isEmpty ||
                                            value.length < 11) {
                                          return 'Please Enter a Valid Number';
                                        }
                                        return null;
                                      },
                                      prefix: Text(
                                        '+02',
                                        style: GoogleFonts.poppins(
                                            color: AppColors.greyColor,
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                const Space(height: 12, width: 0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'National ID',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: nationalIdController,
                                      keyboardType: TextInputType.number,
                                      hint: 'National ID',
                                      validate: (String? value) {
                                        if (value!.isEmpty ||
                                            value.length < 14) {
                                          return 'Please Enter a Valid National ID';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                const Space(height: 12, width: 0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Expiration Date',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: expirationDateController,
                                      keyboardType: TextInputType.datetime,
                                      hint: 'Expiration Date',
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter a Expiration Date';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                const Space(height: 12, width: 0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Date Of Birth',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: dateOfBirthController,
                                      keyboardType: TextInputType.datetime,
                                      hint: 'Date Of Birth',
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter a Date Of Birth';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                const Space(height: 12, width: 0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Password',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.primaryColor,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Space(height: 2, width: 0),
                                    DefaultTextFormField(
                                      context: context,
                                      controller: passWordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      hint: 'Password',
                                      validate: (String? value) {
                                        if (value!.isEmpty ||
                                            value.length < 11) {
                                          return 'Please Enter a Valid Password';
                                        }
                                        return null;
                                      },
                                      suffix: SignUpCubit.get(context).suffix,
                                      isPassword:
                                          SignUpCubit.get(context).isPassword,
                                      suffixPressed: () {
                                        SignUpCubit.get(context)
                                            .changePassword();
                                      },
                                    ),
                                  ],
                                ),
                                const Space(height: 29, width: 0),
                                defaultMaterialButton(
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      OtpCubit.get(context).otpAuthentications(
                                        phoneNumber: phoneController.text,
                                      );
                                      navigateTo(
                                        context,
                                        OtpAuthenticationsScreen(
                                          phoneNumber: phoneController.text,
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Sign Up',
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
