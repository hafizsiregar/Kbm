import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kbm/features/presentation/pages/login/login_page.dart';

class SplashPage extends StatefulWidget {

  static const routeName = 'splash';

  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 4),
    () => Navigator.pushNamed(context, LoginPage.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Page',
        ),
      ),
    );
  }
}