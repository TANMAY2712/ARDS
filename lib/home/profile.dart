import 'package:ards/widgets/backgroundimagedashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF041477),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD9D9D9),
      ),
      body: Stack(
          children: [
            BackgroundImageDashboard(),
          // Background Image
         // BackgroundImageDashboard(),
       Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile_placehiolder.png'), // Replace with an actual image asset
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'John Smith',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Station Master | Central Station',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 10),
            _buildDetailRow('Employee ID:', 'SM12345'),
            _buildDetailRow('Station Name:', 'Central Station'),
            _buildDetailRow('Contact:', '+1 123 456 7890'),
            _buildDetailRow('Email:', 'john.smith@railway.com'),
            _buildDetailRow('Years of Experience:', '12 years'),
          ],
        ),
      ),
          ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF041477),
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
