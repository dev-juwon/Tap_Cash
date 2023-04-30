import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
        image: AssetImage('assets/images/splash_screen.png'),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )),
    );
  }
}
