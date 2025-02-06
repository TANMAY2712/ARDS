import 'package:ards/dashboard/insidents.dart';
import 'package:ards/widgets/backgroundimagedashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Trainlistdetails extends StatelessWidget {
  const Trainlistdetails({required this.data}); // Constructor to accept data
  final String data; // Variable to hold the received data
  @override
  Widget build(BuildContext context) {
    final List<String> points = [
      "Derailed near Nagpur Junction",
      "Speed limit crossed near Ghaziabad",
      "Derailed near Sultanpur",
      "Power issue near Bhopal",
      "Low pressure between cabins near Ghaziabad",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(data+" - Mumbai Rajdhani Express"),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Change the back button color to green
        ),
        backgroundColor: Color(0xFF041477),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
          children: [
          // Background Image
          BackgroundImageDashboard(),
       SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Grid

            // Section 2: Recent Updates

            // Section 3: Train Schedule Table
            SizedBox(height: 20), // Adds 20 pixels of space
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Current Status:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Supervised (5 insidents in last 1 year)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
            ),
            SizedBox(height: 20),
            // Section 4: Train Schedule Table
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  // Action to perform on click
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Insidents(),
                    ),
                  );
                },
                child: Text(
                  'Incidents',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Incidents Stats',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),
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


          ],
        ),
      ),
          ],
      ),
    );
  }
}


Widget buildBulletPoint(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "•", // Bullet character
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(width: 8), // Space between bullet and text
      Expanded(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}