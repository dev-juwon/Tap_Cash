import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';
import 'package:tap_cash/presentation/screens/home_screen.dart';
import 'package:tap_cash/presentation/screens/settings_screen.dart';

class TapCashCubit extends Cubit<TapCashState> {
  TapCashCubit() : super(TapCashInitialState());

  static TapCashCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const SettingScreen(),
  ];

  List<String> titles = [];

  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 0) {}
    if (index == 1) {}
    if (index == 2) {}
    if (index == 3) {}

    emit(ChangeBottomNavBarState());
  }
}
