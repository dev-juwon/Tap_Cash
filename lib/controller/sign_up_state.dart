import 'package:tap_cash/model/user_model/user_model.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final UserModel userModel;

  SignUpSuccessState(this.userModel);
}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState(this.error);
}

class ShowPasswordSignUpState extends SignUpState {}

class OtpLoadingState extends SignUpState {}

class OtpSuccessState extends SignUpState {
  final UserModel userModel;

  OtpSuccessState(this.userModel);
}

class OtpErrorState extends SignUpState {
  final String error;

  OtpErrorState(this.error);
}
