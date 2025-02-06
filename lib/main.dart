import 'package:ards/dashboard/dashboard.dart';
import 'package:ards/login/login-page.dart';
import 'package:ards/otp.dart';
import 'package:ards/preferences/SharedPrefService.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await SharedPrefService.isLoggedIn();
  runApp(MyApp(isLoggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}

