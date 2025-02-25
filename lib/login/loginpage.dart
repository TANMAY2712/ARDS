import 'package:ards/apiService/api_service.dart';
import 'package:ards/otp.dart';
import 'package:ards/widgets/textemail.dart';
import 'package:flutter/material.dart';
import 'package:ards/widgets/palatte.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/widgets.dart';
import 'models/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  List<dynamic> posts = [];

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Function to handle the API call
  Future<void> login() async {
    final String mobile = _mobileController.text.trim();
    final String email = _emailController.text.trim();
    OtpResponse? otpResponse;
    if (mobile.isEmpty) {
      _showSnackBar('Please enter both email and password');
      return;
    }

    try {
      var response = await ApiService.postRequest(context,"Login/GenrateOTP", {
        'Username': mobile, 'APIKey': "AR-AUG-ARST-BIZBR-2019OLLY"
        , 'CountryCode': "+91", 'email': email,
      });
        _showSnackBar('Login successful!');

      if (response is Map<String, dynamic>) {
        setState(() {
          otpResponse = OtpResponse.fromJson(response);
        });
        _showSnackBar(otpResponse!.data.otp.toString());

        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return; // Checks `this.mounted`, not `context.mounted`.
        Navigator.of(context).pop();
        final navigator = Navigator.of(context); // ✅ Store Navigator reference before async call
        navigator.push(MaterialPageRoute(builder: (context) => Otp(data: otpResponse!.data.username.toString()))); // ✅ No context usage after await
      } else {
      }
        // Navigate to the HomePage


    } catch (e) {
      _showSnackBar('An error occurred: $e');
    }
  }

  // Function to show a Snackbar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
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
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20), // Adjust left padding as needed
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in to your Account',
                          style: kHeading,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20), // Adjust left padding as needed
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter phone number to send on time password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Change text color here
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              controler: _mobileController,
                              icon: FontAwesomeIcons.mobile,
                              hint: 'Mobile Number',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),

                            Text(
                              'Forgot Password?',
                              style: forgotText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 50), // Space on top
                            SizedBox(
                              height: 60,
                              width: 400,
                              child:
                              ElevatedButton(
                                onPressed: login,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 60),
                                  backgroundColor: Color(0xFF393262), // Background color
                                ),
                                child: Text(
                                  'Send OTP',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Change text color here
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

