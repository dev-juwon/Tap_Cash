import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tap_cash/controller/tap_cash_cubit.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';

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
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xFF92E3A9),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
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
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: cubit.currentIndex == 0
                    ? const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: ImageIcon(
                          AssetImage(Assets.imagesEmptyWallet),
                          color: Colors.white,
                        ))
                    : const ImageIcon(AssetImage(Assets.imagesEmptyWallet)),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                  icon: cubit.currentIndex == 1
                      ? const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: ImageIcon(
                            AssetImage(Assets.imagesGraph),
                            color: Colors.white,
                          ))
                      : const ImageIcon(AssetImage(Assets.imagesGraph)),
                  label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: cubit.currentIndex == 2
                      ? const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: ImageIcon(
                            AssetImage(Assets.imagesCard),
                            color: Colors.white,
                          ))
                      : const ImageIcon(AssetImage(Assets.imagesCard)),
                  label: 'Card'),
              BottomNavigationBarItem(
                  icon: cubit.currentIndex == 3
                      ? const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: ImageIcon(
                            AssetImage(Assets.imagesCalendar),
                            color: Colors.white,
                          ))
                      : const ImageIcon(AssetImage(Assets.imagesCalendar)),
                  label: 'Reminder'),
              BottomNavigationBarItem(
                  icon: cubit.currentIndex == 4
                      ? const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: ImageIcon(
                            AssetImage(Assets.imagesUser),
                            color: Colors.white,
                          ))
                      : const ImageIcon(AssetImage(Assets.imagesUser)),
                  label: 'Profile'),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
