import 'package:tap_cash/model/user_model/user_model.dart';

abstract class OtpState {}

class OtpInitialState extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpSuccessState extends OtpState {
  final UserModel userModel;

  OtpSuccessState(this.userModel);
}

class OtpErrorState extends OtpState {
  final String error;

  OtpErrorState(this.error);
}
