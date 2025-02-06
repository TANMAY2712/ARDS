
import 'package:flutter/material.dart';

class BackgroundImageDashboard extends StatelessWidget {
  const BackgroundImageDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: 0.1, // Set the alpha (opacity) value (50% transparency)
          child: Image.asset(
            'assets/images/back_login.png', // Replace with your image asset
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Ensure the image fills the screen
          ),
        ),
      ),
    );
}
}


