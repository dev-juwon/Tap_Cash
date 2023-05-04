import 'package:tap_cash/model/user_model/user_model.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final UserModel signInModel;

  SignInSuccessState(this.signInModel);
}

class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState(this.error);
}

class ShowPasswordSignInState extends SignInState {}
