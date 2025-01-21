import 'package:ards/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:ards/palatte.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Login',
                        style: kHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              inputAction: TextInputAction.done,
                            ),
                            Text(
                              'Forgot Password?',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 50), // Space on top
                            SizedBox(
                              height: 60,
                              width: 200,
                              child:
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                );
                                // Respond to button press
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 60), // Optional: Redundant if SizedBox is used
                                textStyle: TextStyle(
                                  fontSize: 20, // Set the desired font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
