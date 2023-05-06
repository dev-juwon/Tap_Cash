import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/tap_cash_cubit.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

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
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Color(0xFFD4EEDD)),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFFD4EEDD),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
