
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

  // void userSignIn({
  //    required String phone,
  //    required String password,
  //    required String otpCode,
  //  }) async {
  //    try {
  //      // Make an API call to sign up the user
  //      final response = await dio.post(
  //        '${AppConstant.apiKey}$signIn',
  //        data: jsonEncode({
  //          'phone_number': phone,
  //          'password': password,
  //          'validation_code': otpCode,
  //        }),
  //        options: Options(
  //          headers: {'Content-Type': 'application/json'},
  //        ),
  //      );
  //
  //      // Check the response for any errors
  //
  //      if (response.statusCode == 200) {
  //        // If the API call was successful, print a success message
  //        print('User signed in successfully.');
  //      } else {
  //        // If the API call failed, print an error message with the status code and error message
  //        print(
  //            'Failed to sign in user. Status code: ${response.statusCode}. Error message: ${response.statusMessage}');
  //      }
  //    } catch (error) {
  //      // If there was an error during the API call, print the error message
  //      print('An error occurred while signing in the user: $error');
  //    }
  //    return null;
  //  }

  // void userSignIn({
  //    required String phone,
  //    required String password,
  //    required String otpCode,
  //  })
  //   emit(SignInLoadingState());
  //   DioHelper.postData(
  //     url: signIn,
  //     data: {
  //       'phone_number': phone,
  //       'password': password,
  //       'validation_code': otpCode,
  //     },
  //   ).then((value) {
  //     signInModel = UserModel.fromJson(value.data);
  //     emit(SignInSuccessState(signInModel!));
  //   }).catchError((error) {
  //     emit(SignInErrorState(error.toString()));
  //   });
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPasswordSignInState());
  }
}
