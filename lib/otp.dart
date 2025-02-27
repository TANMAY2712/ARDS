import 'package:ards/dashboard/dash.dart';
import 'package:ards/main.dart';
import 'package:ards/widgets/backgroundimage.dart';
import 'package:ards/widgets/palatte.dart';
import 'package:flutter/material.dart';
import 'package:ards/apiService/api_service.dart';
import 'preferences/sharedprefservice.dart';

class Otp extends StatefulWidget {
  const Otp({super.key, required this.data});
  final String data;
  @override
  OtpInputPageState createState() => OtpInputPageState();
}

class OtpInputPageState extends State<Otp> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());


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

    try {

      var response = await ApiService.postRequest(context,"Login/GenrateOTP", {
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
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return; // Checks `this.mounted`, not `context.mounted`.
        Navigator.of(context).pop();
        final navigator = Navigator.of(context); // ✅ Store Navigator reference before async call
        navigator.push(MaterialPageRoute(builder: (context) => Dashboard())); // ✅ No context usage after await

      } else {
      }
    } finally {
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
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify Phone Number",
                        style: kHeadingSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "We have sent code to your phone number",
                        style: kSubHeading,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "+91 8299112349",
                        style: kHeadingSmall,
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
                        onPressed: verifyOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF393262),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        ),
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),

                      ),
                      SizedBox(height: 10),
                      Text(
                        "Resend OTP",
                        style: resendStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
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

  const OtpTextField({super.key, required this.controller});

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
