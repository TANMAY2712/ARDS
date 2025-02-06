import 'package:ards/dashboard/dashboard.dart';
import 'package:ards/login/login-page.dart';
import 'package:ards/login/otp.dart';
import 'package:flutter/material.dart';
import 'preferences/SharedPrefService.dart';

Future<void> main() async {
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
