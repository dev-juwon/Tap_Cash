import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/controller/tap_cash_cubit.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/presentation/screens/cards.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TapCashCubit, TapCashState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TapCashCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: cubit.currentIndex == 0 ? 15 : 70,
            backgroundColor:
                cubit.currentIndex == 0 ? Colors.white : AppColors.primaryColor,
            title: Text(cubit.titles[cubit.currentIndex]),
            centerTitle: true,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Color(0xFF92E3A9)),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            shape: StadiumBorder(
              side: BorderSide(
                color: Colors.white,
                width: 3.w,
              ),
            ),
            onPressed: () {
              navigateTo(context, const CardsScreen());
            },
            child: SvgPicture.asset(
              Assets.assetsImagesCard,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5.r,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: cubit.currentIndex,
              selectedItemColor: AppColors.primaryColor,
              selectedLabelStyle:
                  GoogleFonts.poppins(color: AppColors.primaryColor),
              unselectedItemColor: AppColors.greyColor,
              unselectedLabelStyle:
                  GoogleFonts.poppins(color: AppColors.greyColor),
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: ImageIcon(AssetImage(Assets.imagesEmptyWallet)),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(Assets.imagesGraph)),
                    label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(Assets.imagesCalendar)),
                    label: 'Reminder'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(Assets.imagesUser)),
                    label: 'Profile'),
              ],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
