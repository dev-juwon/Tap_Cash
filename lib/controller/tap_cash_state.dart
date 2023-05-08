import 'package:tap_cash/model/user_model/user_model.dart';

abstract class TapCashState {}

class TapCashInitialState extends TapCashState {}

class ChangeBottomNavBarState extends TapCashState {}

class UserLoginLoadingStates extends TapCashState {}

class UserLoginSuccessStates extends TapCashState {
  final UserModel loginModel;

  UserLoginSuccessStates(this.loginModel);
}

class UserLoginErrorStates extends TapCashState {
  final String error;

  UserLoginErrorStates(this.error);
}

class WithdrawalLoadingState extends TapCashState {}

class WithdrawalSuccessState extends TapCashState {
  final UserModel loginModel;

  WithdrawalSuccessState(this.loginModel);
}

class WithdrawalErrorState extends TapCashState {
  final String error;

  WithdrawalErrorState(this.error);
}
