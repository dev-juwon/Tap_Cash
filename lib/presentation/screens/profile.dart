import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 80.h,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(Assets.imagesYoung),
                  radius: 30.r,
                  // backgroundColor: tr,
                ),
                const Space(height: 0, width: 12),
                Expanded(
                  child: Text(
                    'Adam Mohamed',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.penClip))
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            color: Colors.white,
            elevation: 10,
            child: Container(
              margin: const EdgeInsets.all(16).r,
              width: double.infinity,
              height: 280.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor:
                            const Color(0xFF06C258).withOpacity(0.05),
                        child: const Icon(
                          FontAwesomeIcons.user,
                          color: AppColors.primaryColor,
                        ),
                        // backgroundColor: tr,
                      ),
                      const Space(height: 0, width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Account',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Text(
                              'Make changes to your account',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.hintColor,
                            size: 16.sp,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor:
                            const Color(0xFF06C258).withOpacity(0.05),
                        child: const Icon(
                          FontAwesomeIcons.lock,
                          color: AppColors.primaryColor,
                        ),
                        // backgroundColor: tr,
                      ),
                      const Space(height: 0, width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Face ID / Touch ID',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Text(
                              'Manage your device security',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: false,
                        onChanged: (v) {},
                        inactiveTrackColor: const Color(0xFFE8E8E8),
                        inactiveThumbColor: AppColors.hintColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor:
                            const Color(0xFF06C258).withOpacity(0.05),
                        child: const Icon(
                          FontAwesomeIcons.circleCheck,
                          color: AppColors.primaryColor,
                        ),
                        // backgroundColor: tr,
                      ),
                      const Space(height: 0, width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Two-Factor Authentication',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Text(
                              'Further secure your account for safety',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.hintColor,
                            size: 16.sp,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor:
                            const Color(0xFF06C258).withOpacity(0.05),
                        child: const Icon(
                          Icons.logout,
                          color: AppColors.primaryColor,
                        ),
                        // backgroundColor: tr,
                      ),
                      const Space(height: 0, width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Log out',
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Text(
                              'Further secure your account for safety',
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.hintColor,
                            size: 16.sp,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'More',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: const Color(0xFF181D27),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            color: Colors.white,
            elevation: 10,
            child: Container(
              margin: const EdgeInsets.all(16).r,
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor:
                            const Color(0xFF06C258).withOpacity(0.05),
                        child: const Icon(
                          Icons.notification_important,
                          color: AppColors.primaryColor,
                        ),
                        // backgroundColor: tr,
                      ),
                      const Space(height: 0, width: 10),
                      Text(
                        'Help & Support',
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.hintColor,
                            size: 16.sp,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor:
                            const Color(0xFF06C258).withOpacity(0.05),
                        child: const Icon(
                          FontAwesomeIcons.heart,
                          color: AppColors.primaryColor,
                        ),
                        // backgroundColor: tr,
                      ),
                      const Space(height: 0, width: 10),
                      Text(
                        'About App',
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.hintColor,
                            size: 16.sp,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
