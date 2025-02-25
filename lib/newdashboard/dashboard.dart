import 'package:flutter/material.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  final List<String> recentItems = [
    'Recent File 1',
    'Recent File 2',
    'Recent File 3',
    'Recent File 4',
    'Recent File 5',
    'Recent File 6',
    'Recent File 7',
    'Recent File 8',
    'Recent File 9',
    'Recent File 10',
  ];
  int _currentIndex = 0; // To track the selected tab

  // Titles for each fragment
  final List<String> _titles = [
    'Dashboard',
    'History',
    'Profile',
    'Help',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'WUS ARDS',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF041477),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFD9D9D9),
        ),
        backgroundColor: Color(0xFFD9D9D9),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/dashboard_back_image.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi Again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF041477),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recents',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: recentItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.history, color: Colors.blue),
                            title: Text(
                              recentItems[index],
                              style: TextStyle(fontSize: 18, color: Colors.black87),
                            ),
                            onTap: () {
                              print('Clicked on ${recentItems[index]}');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Highlight the selected tab
          onTap: (index) {
            // Handle navigation
          },
          selectedFontSize: 12, // Set font size for selected item
          unselectedFontSize: 12, // Set font size for unselected items
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/home.png", width: 25, height: 25),
                  SizedBox(height: 5), // Space between icon and text
                ],
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/search.png", width: 25, height: 25),
                  SizedBox(height: 5),
                ],
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/scanner.png", width: 45, height: 45),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/history.png", width: 25, height: 25),
                  SizedBox(height: 5),
                ],
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/user.png", width: 25, height: 25),
                  SizedBox(height: 5),
                ],
              ),
              label: 'Help',
            ),
          ],
          selectedItemColor: Color(0xFF041477), // Active tab color
          unselectedItemColor: Colors.grey, // Inactive tab color
          type: BottomNavigationBarType.fixed, // Prevent shifting effect
        ),

      ),
    );
  }
}
