import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/bloc_observer.dart';
import 'package:tap_cash/core/app_string/app_string.dart';
import 'package:tap_cash/core/network/app_constant.dart';
import 'package:tap_cash/core/network/cache_helper.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/presentation/screens/on_board_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();

  AppConstant.uId = CacheHelper.getData(key: 'uId');
  if (kDebugMode) {
    print('User ID = ${AppConstant.uId}');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppString.appTitle,
              theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    systemOverlayStyle:
                        SystemUiOverlayStyle(statusBarColor: Color(0xFFD4EEDD)),
                  )),
              home: const OnBoardingScreen(),
            );
          },
        );
      },
    );
  }
}
