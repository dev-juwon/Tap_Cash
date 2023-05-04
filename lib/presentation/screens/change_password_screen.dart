import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/controller/change_password_cubit.dart';
import 'package:tap_cash/controller/change_password_state.dart';
import 'package:tap_cash/controller/sign_up_cubit.dart';
import 'package:tap_cash/core/app_color/app_color.dart';
import 'package:tap_cash/core/components/buttons.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/components/text_form_field.dart';
import 'package:tap_cash/generated/assets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          // TODO: implement listener
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
                      child: FittedBox(
                        child: Text(
                          'Change Password',
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600),
                        ),
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
                                Text(
                                  'Password',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Space(height: 12, width: 0),
                                DefaultTextFormField(
                                  context: context,
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hint: 'Password',
                                  suffix:
                                      ChangePasswordCubit.get(context).suffix,
                                  isPassword: ChangePasswordCubit.get(context)
                                      .isPassword,
                                  suffixPressed: () {
                                    ChangePasswordCubit.get(context)
                                        .changePassword();
                                  },
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter a Valid password';
                                    } else if (passwordController.text !=
                                        confirmPasswordController.text) {
                                      return 'Please Enter a same password';
                                    }
                                    return null;
                                  },
                                ),
                                const Space(height: 16, width: 0),
                                Text(
                                  'Confirm Password',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Space(height: 12, width: 0),
                                DefaultTextFormField(
                                  context: context,
                                  controller: confirmPasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  hint: 'Confirm Password',
                                  suffix:
                                      ChangePasswordCubit.get(context).suffix,
                                  isPassword: ChangePasswordCubit.get(context)
                                      .isPassword,
                                  suffixPressed: () {
                                    ChangePasswordCubit.get(context)
                                        .changePassword();
                                  },
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter a Valid password';
                                    } else if (confirmPasswordController.text !=
                                        passwordController.text) {
                                      return 'Please Enter a same password';
                                    }

                                    return null;
                                  },
                                ),
                                const Space(height: 29, width: 0),
                                defaultMaterialButton(
                                  function: () {
                                    if (formKey.currentState!.validate()) {}
                                  },
                                  text: 'Save',
                                  color: AppColors.primaryColor,
                                ),
                                Space(height: 90.h, width: 0),
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
