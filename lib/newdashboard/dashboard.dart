import 'package:ards/dashboard/dash.dart';
import 'package:ards/home/help.dart';
import 'package:ards/home/history.dart';
import 'package:ards/home/profile.dart';
import 'package:ards/newdashboard/recentitemcardadapter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Dash());
}

class Dash extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dash> {
  int _currentIndex = 0; // To track the selected tab

  // Train list data
  final List<Map<String, dynamic>> trainList = [
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      'Recents',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: trainList.length,
                        itemBuilder: (context, index) {
                          return TrainCard(trainData: trainList[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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