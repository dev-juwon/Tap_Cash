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
import 'package:tap_cash/presentation/screens/layout_smart_card.dart';

class CreateCardScreen extends StatelessWidget {
  const CreateCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
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
              'Create Card',
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
                    'Name shown on card',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Space(height: 16, width: 0),
                  DefaultTextFormField(
                    context: context,
                    controller: nameController,
                    keyboardType: TextInputType.phone,
                    hint: 'Name',
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Enter a valid name';
                      }
                      return null;
                    },
                  ),
                  const Space(height: 20, width: 0),
                  Text(
                    'Address',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Space(height: 16, width: 0),
                  DefaultTextFormField(
                    context: context,
                    controller: addressController,
                    keyboardType: TextInputType.number,
                    hint: 'Address',
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Enter a valid Address';
                      }
                      return null;
                    },
                  ),
                  const Space(height: 20, width: 0),
                  const Space(height: 32, width: 0),
                  defaultMaterialButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        navigateTo(context, const LayoutSmartCardScreen());
                      }
                    },
                    text: 'Deliver',
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
