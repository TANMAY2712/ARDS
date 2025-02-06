import 'package:ards/apiService/api_service.dart';
import 'package:ards/otp.dart';
import 'package:ards/widgets/text-email.dart';
import 'package:flutter/material.dart';
import 'package:ards/widgets/palatte.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/widgets.dart';
import 'models/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<dynamic> posts = [];
  bool isLoading = true;

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  // Function to handle the API call
  Future<void> login() async {
    final String mobile = _mobileController.text.trim();
    final String email = _emailController.text.trim();
    OtpResponse? otpResponse;
    if (mobile.isEmpty) {
      _showSnackBar('Please enter both email and password');
      return;
    }

    setState(() {
      _isLoading = true;
    });


    try {
      var response = await ApiService.postRequest("Login/GenrateOTP", {
        'Username': mobile, 'APIKey': "AR-AUG-ARST-BIZBR-2019OLLY"
        , 'CountryCode': "+91", 'email': email,
      });
        _showSnackBar('Login successful!');

      if (response is Map<String, dynamic>) {
        setState(() {
          otpResponse = OtpResponse.fromJson(response);
        });
        _showSnackBar(otpResponse!.data.otp.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp(data: otpResponse!.data.username.toString()),
          ),
        );
      } else {
        print("Invalid response format");
      }
        // Navigate to the HomePage


    } catch (e) {
      _showSnackBar('An error occurred: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                              controler: _mobileController,
                              icon: FontAwesomeIcons.mobile,
                              hint: 'Mobile Number',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            TextEmail(
                              controler: _emailController,
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email (Optional)',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done
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
                                onPressed: _isLoading ? null : login,
                                child: _isLoading
                                    ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                )
                                    : Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 60),
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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

