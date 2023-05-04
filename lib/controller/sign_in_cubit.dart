import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/sign_in_state.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/core/network/end_points.dart';
import 'package:tap_cash/model/user_model/user_model.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  UserModel? signInModel;

  void userSignIn(
      {required String phone,
      required String password,
      required String otpCode}) {
    emit(SignInLoadingState());
    DioHelper.postData(
      url: signIn,
      data: {
        'phone_number': phone,
        'password': password,
        'validation_code': otpCode,
      },
    ).then((value) {
      signInModel = UserModel.fromJson(value.data);
      emit(SignInSuccessState(signInModel!));
    }).catchError((error) {
      emit(SignInErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPasswordSignInState());
  }
}
