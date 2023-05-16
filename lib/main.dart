import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/bloc_observer.dart';
import 'package:tap_cash/controller/tap_cash_cubit.dart';
import 'package:tap_cash/controller/tap_cash_state.dart';
import 'package:tap_cash/core/app_string/app_string.dart';
import 'package:tap_cash/core/network/app_constant.dart';
import 'package:tap_cash/core/network/cache_helper.dart';
import 'package:tap_cash/core/network/dio_helper.dart';
import 'package:tap_cash/presentation/screens/layout_screen.dart';
import 'package:tap_cash/presentation/screens/on_board_screen.dart';
import 'package:tap_cash/presentation/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  uId = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (uId != null) {
      widget = const LayoutScreen();
    } else {
      widget = const SignInScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  if (kDebugMode) {
    print('User ID = $uId');
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TapCashCubit()),
      ],
      child: BlocConsumer<TapCashCubit, TapCashState>(
        builder: (context, state) {
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
                        systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Color(0xFF92E3A9),
                        ),
                      ),
                    ),
                    home: LayoutScreen(),
                  );
                },
              );
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
