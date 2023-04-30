import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/core/app_string/app_string.dart';
import 'package:tap_cash/presentation/screens/splash_screen.dart';

void main() async {
  ScreenUtil.ensureScreenSize();
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
          designSize: const Size(375, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppString.appTitle,
              theme: ThemeData.dark()
                  .copyWith(scaffoldBackgroundColor: Colors.white),
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
