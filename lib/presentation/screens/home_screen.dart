import 'package:flutter/material.dart';
import 'package:tap_cash/core/components/log_out.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: TextButton(
              onPressed: () {
                logOut(context);
              },
              child: Text('Log Out')),
        ));
  }
}
