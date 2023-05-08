import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/sign_up_state.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/core/network/end_points.dart';
import 'package:tap_cash/model/user_model/user_model.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  UserModel? signUpModel;
  final dio = Dio();

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
      url: signup,
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
      signUpModel = UserModel.fromJson(value.data);
      emit(SignUpSuccessState(signUpModel!));
    }).catchError((error) {
      emit(SignUpErrorState(error.toString()));
      print(error);
    });
  }

  void otpAuthentications({
    required String phoneNumber,
  }) async {
    try {
      // Make an API call to sign up the user
      final response = await dio.post(
        'https://tabcash.vercel.app/messaging/sms-verification',
        data: jsonEncode({
          'phone_number': phoneNumber,
        }),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // Check the response for any errors
      if (response.statusCode == 200) {
        // If the API call was successful, print a success message
        if (kDebugMode) {
          print('User send otp successfully.');
        }
      } else {
        // If the API call failed, print an error message with the status code and error message
        if (kDebugMode) {
          print(
              'Failed to send otp user. Status code: ${response.statusCode}. Error message: ${response.statusMessage}');
        }
      }
    } catch (error) {
      // If there was an error during the API call, print the error message
      if (kDebugMode) {
        print('An error occurred while send otp the user: $error');
      }
    }
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
