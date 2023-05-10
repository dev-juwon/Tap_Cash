import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/components/my_divider.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/presentation/screens/bill_screen.dart';
import 'package:tap_cash/presentation/screens/charge_screen.dart';
import 'package:tap_cash/presentation/screens/money_transfer_screen.dart';
import 'package:tap_cash/presentation/screens/more_screen.dart';
import 'package:tap_cash/presentation/screens/transaction_history_screen.dart';
import 'package:tap_cash/presentation/screens/withdraw.dart';

class SmartCardScreen extends StatelessWidget {
  const SmartCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> transfer = [
      InkWell(
        onTap: () {
          navigateTo(context, const WithDrawScreen());
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: const Color(0xFFE2FEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesEmptyWalletAdd),
              const Space(height: 6, width: 0),
              Text(
                'Withdraw',
                style: GoogleFonts.poppins(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          navigateTo(context, const MoneyTransferScreen());
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: const Color(0xFFE2FEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesEmptyWalletChange),
              const Space(height: 6, width: 0),
              Text(
                'Transfer',
                style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          navigateTo(context, const TransactionHistoryScreen());
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: const Color(0xFFE2FEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesHistory),
              const Space(height: 6, width: 0),
              Text(
                'History',
                style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    List<Widget> services = [
      InkWell(
        onTap: () {
          navigateTo(context, const BillScreen());
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: const Color(0xFFE2FEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesBill),
              const Space(height: 6, width: 0),
              Text(
                'Bills',
                style: GoogleFonts.poppins(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          navigateTo(context, const ChargeScreen());
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: const Color(0xFFE2FEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesChane),
              const Space(height: 6, width: 0),
              Text(
                'Charge',
                style: GoogleFonts.poppins(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          navigateTo(context, const MoreScreen());
        },
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: const Color(0xFFE2FEEE),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesMore),
              const Space(height: 6, width: 0),
              Text(
                'More',
                style: GoogleFonts.poppins(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Space(height: 17, width: 0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Main Card',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 82,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFE2FEEE)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Add',
                          style: GoogleFonts.poppins(
                              color: AppColors.primaryColor),
                        ),
                        const Icon(
                          Icons.add_card_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const MyDivider(
            color: AppColors.primaryColor,
          ),
          const Space(height: 17, width: 0),
          SvgPicture.asset(Assets.imagesSmartTecnopattern),
          Space(height: 10.h, width: 0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transactions',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D2939),
                  ),
                ),
                Space(height: 8.h, width: 0),
                GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8).r,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 1.h / 1.2.h,
                  children: List.generate(
                      transfer.length, (index) => transfer[index]),
                ),
                Space(height: 10.h, width: 0),
                Text(
                  'Services',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D2939),
                  ),
                ),
                Space(height: 8.h, width: 0),
                GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8).r,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 1.h / 1.2.h,
                  children: List.generate(
                      services.length, (index) => services[index]),
                ),
                Space(height: 10.h, width: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
