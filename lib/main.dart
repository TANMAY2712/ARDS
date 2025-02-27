import 'package:ards/dashboard/dash.dart';
import 'package:ards/home/help.dart';
import 'package:ards/home/history.dart';
import 'package:ards/home/profile.dart';
import 'package:ards/login/loginpage.dart';
import 'package:ards/newdashboard/dashboard.dart';
import 'package:ards/preferences/sharedprefservice.dart';
import 'package:ards/uploadvideo/VideoUploadApp.dart';
import 'package:ards/video_streaming.dart';
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
      home: isLoggedIn ? LoginPage() : LoginPage(),  // ✅ Now correctly uses isLoggedIn
    );
  }
}
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0; // Track the selected tab

  final List<Widget> _pages = [
    Dash(),
    History(),
    History(),// Placeholder for Scanner
    Profile(),
    Help(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Dynamically update body
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight selected tab
        onTap: (index) {
          if (index == 2) {
            // Handle Scanner Button Click (if any special logic needed)
            return;
          }
          setState(() {
            _currentIndex = index; // Update selected index
          });
        },
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Color(0xFF041477),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/home.png", width: 25, height: 25),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/search.png", width: 25, height: 25),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/scanner.png", width: 45, height: 45),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/history.png", width: 25, height: 25),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/user.png", width: 25, height: 25),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}