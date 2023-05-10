import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/presentation/screens/create_crad.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(child: Image.asset(Assets.imagesCreditCards)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 26.r,
                backgroundColor: AppColors.primaryColor,
                child: IconButton(
                  onPressed: () {
                    navigateTo(context, CreateCardScreen());
                  },
                  icon: Icon(
                    Icons.add,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
