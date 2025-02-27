import 'package:ards/newdashboard/recentitemcardadapter.dart';
import 'package:ards/widgets/backgroundimagedashboard.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});
  @override
  TrainHistoryScreenState createState() => TrainHistoryScreenState();
}

class TrainHistoryScreenState extends State<History> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _trainList = [
    {
      "trainName": "Sabarmati Express",
      "trainNumber": "12578",
      "source": "DELHI",
      "destination": "BHOPAL",
      "departureTime": "11:00",
      "arrivalTime": "23:35",
      "faults": 2,
    },
    {
      "trainName": "Shatabdi Express",
      "trainNumber": "12002",
      "source": "MUMBAI",
      "destination": "PUNE",
      "departureTime": "06:00",
      "arrivalTime": "09:00",
      "faults": 1,
    },
    {
      "trainName": "Rajdhani Express",
      "trainNumber": "12951",
      "source": "DELHI",
      "destination": "MUMBAI",
      "departureTime": "16:30",
      "arrivalTime": "08:45",
      "faults": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 30,
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
          // 🔹 Search Bar (Without Filtering)
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Train No./ Name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                BackgroundImageDashboard(),
                ListView.builder(
                  itemCount: _trainList.length,
                  itemBuilder: (context, index) {
                    return TrainCard(trainData: _trainList[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
