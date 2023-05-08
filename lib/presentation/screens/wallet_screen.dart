import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/presentation/screens/bill_screen.dart';
import 'package:tap_cash/presentation/screens/charge_screen.dart';
import 'package:tap_cash/presentation/screens/money_transfer_screen.dart';
import 'package:tap_cash/presentation/screens/more_screen.dart';
import 'package:tap_cash/presentation/screens/notifications_screen.dart';
import 'package:tap_cash/presentation/screens/transaction_history_screen.dart';
import 'package:tap_cash/presentation/screens/withdraw.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);

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
    List<Widget> offers = [
      Container(
        width: 341,
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(0, 82, 242, 0.5),
              Color.fromRGBO(0, 244, 98, 0.5),
            ],
          ),
        ),
      ),
      Container(
        width: 341,
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(0, 82, 242, 0.5),
              Color.fromRGBO(0, 244, 98, 0.5),
            ],
          ),
        ),
      ),
      Container(
        width: 341,
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromRGBO(0, 82, 242, 0.5),
              Color.fromRGBO(0, 244, 98, 0.5),
            ],
          ),
        ),
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 42,
                      width: 313,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        onTap: () {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.greyColor),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xFFF5F5F5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xFFF5F5F5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: Color(0xFFF5F5F5)),
                          ),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: Colors.grey),
                          prefixIcon: const Icon(Icons.search,
                              color: AppColors.greyColor),
                        ),
                      ),
                    ),
                  ),
                  const Space(height: 0, width: 10),
                  IconButton(
                      onPressed: () {
                        navigateTo(context, const NotificationsScreen());
                      },
                      icon: Icon(
                        Icons.notification_important_sharp,
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ))
                ],
              ),
              Space(height: 20.h, width: 0),
              SvgPicture.asset(Assets.imagesTecnoPattern),
              Space(height: 10.h, width: 0),
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
                children:
                    List.generate(transfer.length, (index) => transfer[index]),
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
                children:
                    List.generate(services.length, (index) => services[index]),
              ),
              Space(height: 10.h, width: 0),
              Text(
                'Offers',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D2939),
                ),
              ),
              Space(height: 8.h, width: 0),
              SizedBox(
                height: 184,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return offers[index];
                  },
                  separatorBuilder: (context, _) {
                    return Space(height: 0.h, width: 16.w);
                  },
                  itemCount: offers.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
