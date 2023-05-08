import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';
import 'package:tap_cash/core/network/app_constant.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/core/network/end_points.dart';
import 'package:tap_cash/model/user_model/user_model.dart';
import 'package:tap_cash/presentation/screens/dashbord.dart';
import 'package:tap_cash/presentation/screens/wallet_screen.dart';
import 'package:tap_cash/presentation/screens/profile.dart';
import 'package:tap_cash/presentation/screens/reminder.dart';

class TapCashCubit extends Cubit<TapCashState> {
  TapCashCubit() : super(TapCashInitialState());

  static TapCashCubit get(context) => BlocProvider.of(context);
  final dio = Dio();
  int currentIndex = 0;

  List<Widget> screens = [
    WalletScreen(),
    const DashboardScreen(),
    const ReminderScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    'Reminder',
    'Dashboard',
    'Reminder',
    'Profile',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    if (index == 0) {}
    if (index == 1) {}
    if (index == 2) {}
    if (index == 3) {}

    emit(ChangeBottomNavBarState());
  }

  UserModel? userData;

  void getUserData() {
    emit(UserLoginLoadingStates());

    DioHelper.getData(
      url: profile,
      token: uId,
    ).then((value) {
      userData = UserModel.fromJson(value.data);
      emit(UserLoginSuccessStates(userData!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(UserLoginErrorStates(error.toString()));
    });
  }

  void withDraw({
    required String amount,
    required String bankAccountNumber,
    required String password,
  }) async {
    try {
      final response = await dio.patch(
        'https://tabcash.vercel.app/transactions/withdrawal',
        data: jsonEncode({
          'amount': amount,
          'bank_account_number': bankAccountNumber,
          'password': password,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization': uId,
          },
        ),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('User send otp successfully.');
        }
      } else {
        if (kDebugMode) {
          print(
              'Failed to send otp user. Status code: ${response.statusCode}. Error message: ${response.statusMessage}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('An error occurred while send otp the user: $error');
      }
    }
  }
}
