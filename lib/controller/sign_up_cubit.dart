import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/sign_up_state.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/core/network/end_points.dart';
import 'package:tap_cash/model/user_model/user_model.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void userSignUp({
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String password,
    required String nationalID,
    required String expirationDate,
    required String dateOfBirth,
    required String validationCode,
  }) {
    emit(SignUpLoadingState());

    DioHelper.postData(
      url: signUp,
      data: {
        'phone_number': phoneNumber,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'national_ID': nationalID,
        'expiration_date': expirationDate,
        'date_of_birth': dateOfBirth,
        'validation_code': validationCode,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(SignUpSuccessState(userModel!));
    }).catchError((error) {
      emit(SignUpErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPasswordSignUpState());
  }
}
