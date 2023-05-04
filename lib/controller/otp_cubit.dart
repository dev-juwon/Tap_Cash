import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/controller/otp_state.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/core/network/end_points.dart';
import 'package:tap_cash/model/user_model/user_model.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void otpAuthentications({
    required String phoneNumber,
  }) {
    emit(OtpLoadingState());

    DioHelper.postData(
      url: otp,
      data: {
        'phone_number': phoneNumber,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(OtpSuccessState(userModel!));
    }).catchError((error) {
      emit(OtpErrorState(error.toString()));
    });
  }
}
