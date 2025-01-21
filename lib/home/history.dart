import 'package:ards/widgets/background-image-dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: History(),
  ));
}

class History extends StatefulWidget {
  @override
  _TrainHistoryScreenState createState() => _TrainHistoryScreenState();
}

class _TrainHistoryScreenState extends State<History> {
  // Train history data
  List<Map<String, String>> trainHistory = [
    {
      "trainName": "Shatabdi Express",
      "trainNo": "12345",
      "platformNo": "16",
      "side": "Left"
    },
    {
      "trainName": "Rajdhani Express",
      "trainNo": "67890",
      "platformNo": "15",
      "side": "Right"
    },
    {
      "trainName": "Duronto Express",
      "trainNo": "11223",
      "platformNo": "12",
      "side": "Left"
    },
    {
      "trainName": "Chennai Express",
      "trainNo": "44556",
      "platformNo": "14",
      "side": "Right"
    },
    {
      "trainName": "Rajdhani Express",
      "trainNo": "77889",
      "platformNo": "15",
      "side": "Left"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          BackgroundImageDashboard(),
          // Content
          ListView.builder(
            itemCount: trainHistory.length,
            itemBuilder: (context, index) {
              final train = trainHistory[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF041477),
                    child: Icon(
                      Icons.train, // Train icon
                      color: Colors.white, // Icon color
                    ),
                  ),
                  title: Text(
                    "${train["trainName"]!} (${train["trainNo"]!})",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Platform: ${train["platformNo"]}, Side: ${train["side"]}",
                  ),
                  trailing: Icon(
                    train["side"] == "Left"
                        ? Icons.arrow_back // Icon for left side
                        : Icons.arrow_forward, // Icon for right side
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
