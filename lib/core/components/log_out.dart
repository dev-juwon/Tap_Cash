import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/network/cache_helper.dart';
import 'package:tap_cash/presentation/screens/on_board_screen.dart';

void logOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, OnBoardingScreen());
    }
  });
}
