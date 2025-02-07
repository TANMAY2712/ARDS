import 'package:ards/dashboard/dashboard.dart';
import 'package:ards/widgets/backgroundimage.dart';
import 'package:flutter/material.dart';
import 'package:ards/apiService/api_service.dart';
import 'preferences/sharedprefservice.dart';

class Otp extends StatefulWidget {
  const Otp({required this.data});
  final String data;
  @override
  OtpInputPageState createState() => OtpInputPageState();
}

class OtpInputPageState extends State<Otp> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  bool _isLoading = false;

  // Function to concatenate OTP digits
  String getOtp() {
    return _controllers.map((controller) => controller.text).join();
  }

  // Function to call the OTP verification API
  Future<void> verifyOtp() async {
    String otp = getOtp();

    if (otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 6-digit OTP")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {

      var response = await ApiService.postRequest("Login/GenrateOTP", {
        "Username":widget.data,
        "CountryCode":"+91",
        "OTP": otp,
        "RefferedCode":"",
        "APIKey": "AR-AUG-ARST-BIZBR-2019OLLY",
      });
      await SharedPrefService.saveLoginData(widget.data);
      _showSnackBar('OTP Verified Successfully!');

      if (response is Map<String, dynamic>) {
        setState(() {
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
      }

    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter the OTP sent to your mobile number",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                      (index) => OtpTextField(
                    controller: _controllers[index],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isLoading ? null : verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF041477), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                  "Verify OTP",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    ],
    );
  }
}

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;

  OtpTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.alphaBlend(Colors.grey.withAlpha(51), Colors.transparent),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "", // Removes the counter below the TextField
          border: InputBorder.none, // Removes the default border
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to the next field
          }
        },
      ),
    );
  }
}
