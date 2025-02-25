
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: 0.2, // Set the alpha (opacity) value (50% transparency)
          child: Image.asset(
            'assets/images/login_back_image.png', // Replace with your image asset
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // Ensure the image fills the screen
          ),
        ),
      ),
    );
  }
}


