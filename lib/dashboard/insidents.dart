import 'package:ards/widgets/background-image-dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Insidents(),
  ));
}

class Insidents extends StatefulWidget {
  @override
  _TrainHistoryScreenState createState() => _TrainHistoryScreenState();
}

class _TrainHistoryScreenState extends State<Insidents> {
  // List of train details
  List<Map<String, String>> trainHistory = [
    {"trainNo": "12345", "trainName": "Shatabdi Express", "route": "Delhi - Bhopal"},
    {"trainNo": "67890", "trainName": "Rajdhani Express", "route": "Delhi - Lucknow"},
    {"trainNo": "11223", "trainName": "Duronto Express", "route": "Delhi - Mumbai"},
    {"trainNo": "44556", "trainName": "Chennai Express", "route": "Delhi - Varodra"},
    {"trainNo": "77889", "trainName": "Rajdhani Express", "route": "Delhi - Punjab"},
  ];

  // Search query
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Filtered list based on search query
    List<Map<String, String>> filteredTrains = trainHistory.where((train) {
      return train["trainNo"]!.contains(searchQuery) ||
          train["trainName"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          train["route"]!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Incidents Lists"),
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
       Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search by train number, name, or part",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
          ),

          // Train List
          Expanded(
            child: ListView.builder(
              itemCount: filteredTrains.length,
              itemBuilder: (context, index) {
                final train = filteredTrains[index];
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
                      train["trainName"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(train["route"]!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
          ],
      ),
    );
  }
}
