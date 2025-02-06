import 'package:ards/dashboard/trainlistdetails.dart';
import 'package:ards/home/help.dart';
import 'package:ards/home/profile.dart';
import 'package:ards/home/history.dart';
import 'package:ards/login/loginpage.dart';
import 'package:ards/widgets/backgroundimagedashboard.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../preferences/sharedprefservice.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Use super.key here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Use super.key here
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int _currentIndex = 0; // To track the selected tab

  // Titles for each fragment
  final List<String> _titles = [
    'Dashboard',
    'History',
    'Profile',
    'Help',
  ];

  // List of pages (fragments) to display
  final List<Widget> _pages = [
    Home(),
    History(),
    Profile(),
    Help(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,  // Prevents back navigation
    child: Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () async {
              await SharedPrefService.logout();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
              // Navigate or perform an action here
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/logout.png",
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
        title: Text(_titles[_currentIndex]), // Set the title dynamically
        backgroundColor: Color(0xFF041477),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the selected tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
        selectedItemColor: Color(0xFF041477), // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        type: BottomNavigationBarType.fixed, // Prevent shifting effect
      ),
    )
    );
  }
}

// Pages (fragments) for navigation
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      '12618',
      '18645',
      '12784',
      '13846',
      '18764',
      '17365',
      '20856',
      '12418',
    ];
    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.yellow,
      Colors.pink,
    ];
    final List<String> points = [
      "Shatabdi Express 22764 from Delhi to Punjab.",
      "Rajdhani Express 14657 from Delhi to Lucknow",
      "Chennai Express 23753 from Delhi to Chennai",
      "Bhopal Shatabdi 16473 from Delhi to Bhopal",
    ];
    return Stack(
      children: [
        BackgroundImageDashboard(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Depot Incidents',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBox(Colors.blue, 'Complete'),
                      _buildBox(Colors.green, 'Processing'),
                      _buildBox(Colors.orange, 'Investigating'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: [
                              PieChartSectionData(
                                value: 25,
                                color: Colors.blue,
                                title: '25%',
                                radius: 50,
                                titleStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              PieChartSectionData(
                                value: 35,
                                color: Colors.green,
                                title: '35%',
                                radius: 50,
                                titleStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              PieChartSectionData(
                                value: 40,
                                color: Colors.orange,
                                title: '40%',
                                radius: 50,
                                titleStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Recently Scanned Trains',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Trainlistdetails(data: "${items[index]}"),
                            ),
                          );
                        },
                        child: Card(
                          color: colors[index % colors.length],
                          elevation: 5,
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    icon: Icon(Icons.search, color: Color(0xFFFFFFFF)),
                    label: Text(
                      'Search Incident (Train/Part/name/Number)',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF041477), // Set background color
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Latest Incidents',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: points.map((point) => buildBulletPoint(point)).toList(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showCustomDialog(context);
            },
            backgroundColor: Color(0xFF041477), // Change the background color
            child: Icon(
              Icons.add,
              color: Colors.white, // Icon color
            ),
          ),
        ),
      ],
    );
  }

}

void showCustomDialog(BuildContext context) {
  TextEditingController trainController = TextEditingController();
  TextEditingController stationController = TextEditingController();
  String selectedSide = "Left";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text("Please fill required information"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Train Number Input Field
              SizedBox(height: 15),
              TextField(
                controller: trainController,
                decoration: InputDecoration(
                  labelText: "Train Number",
                  prefixIcon: Icon(Icons.train),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // Station Name Input Field
              TextField(
                controller: stationController,
                decoration: InputDecoration(
                  labelText: "Station Name",
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              // Radio Buttons for Side Selection
              Row(
                children: [
                  Text("Choose Side:"),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Radio<String>(
                          value: "Left",
                          groupValue: selectedSide,
                          onChanged: (value) {
                            selectedSide = value!;
                            Navigator.of(context).pop();
                            showCustomDialog(context); // To refresh dialog state
                          },
                        ),
                        Text("Left"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio<String>(
                          value: "Right",
                          groupValue: selectedSide,
                          onChanged: (value) {
                            selectedSide = value!;
                            Navigator.of(context).pop();
                            showCustomDialog(context); // To refresh dialog state
                          },
                        ),
                        Text("Right"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Submit"),
          ),
        ],
      );
    },
  );
}


Widget _buildBox(Color color, String name) {
  return Container(
    width: 130, // Set width of the box
    height: 50, // Set height of the box
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Ensure text is visible on dark backgrounds
        ),
      ),
    ),

  );
}
