import 'package:ards/dashboard/dashboard.dart';
import 'package:ards/login/loginpage.dart';
import 'package:ards/preferences/sharedprefservice.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await SharedPrefService.isLoggedIn();
  runApp(MyApp(isLoggedIn: loggedIn));  // ✅ Pass isLoggedIn to MyApp
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;  // ✅ Define the field
  const MyApp({super.key, required this.isLoggedIn});  // ✅ Pass key and required parameter
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : LoginPage(),  // ✅ Now correctly uses isLoggedIn
    );
  }
}
