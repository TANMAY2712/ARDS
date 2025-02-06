import 'package:ards/widgets/backgroundimagedashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Help(),
  ));
}

class Help extends StatelessWidget {
  const Help({super.key});
  // Contact Information List

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> contactInfo = [
      {"title": "Help Number", "value": "+123-456-7890", "color": Colors.redAccent},
      {"title": "WhatsApp", "value": "+123-456-7890", "color": Colors.green},
      {"title": "E-Mail", "value": "help@example.com", "color": Colors.blueAccent},
    ];
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          BackgroundImageDashboard(),

          // Contact Info List
          ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: contactInfo.length,
            itemBuilder: (context, index) {
              final contact = contactInfo[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: contact["color"], // Dynamic background color
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact["title"], // Title (e.g., Help Number)
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      contact["value"], // Value (e.g., Phone Number)
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // App Version at the Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "App Version: 1.0.0", // Replace with your app's version
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF041477),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
