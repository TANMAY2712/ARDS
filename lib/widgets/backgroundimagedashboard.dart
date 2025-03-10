
import 'package:flutter/material.dart';

class BackgroundImageDashboard extends StatelessWidget {
  const BackgroundImageDashboard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Center(
        child: Opacity(
          opacity: 0.1, // Set the alpha (opacity) value (50% transparency)
          child: Image.asset(
            'assets/images/back_history.png', // Replace with your image asset
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Ensure the image fills the screen
          ),
        ),
      ),
    );
}
}


