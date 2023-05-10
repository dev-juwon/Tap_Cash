import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: SvgPicture.asset(Assets.imagesNotifications)),
          Text(
            'No notifications yet',
            style: GoogleFonts.poppins(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 26.r,
                backgroundColor: AppColors.primaryColor,
                child: IconButton(
                  onPressed: () {},
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
