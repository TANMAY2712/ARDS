import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://dev.workerunionsupport.com/api/"; // Example API

  // Generic GET method with Loader
  static Future<dynamic> getRequest(BuildContext context, String endpoint) async {
    _showLoader(context);
    try {
      final response = await http.get(Uri.parse("$baseUrl/$endpoint"));
      _hideLoader(context);

      if (response.statusCode == 200) {
        return json.decode(response.body); // Convert response to JSON
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      _hideLoader(context);
      throw Exception("Error: $e");
    }
  }

  // Generic POST method with Loader
  static Future<dynamic> postRequest(BuildContext context, String endpoint, Map<String, dynamic> data) async {
    _showLoader(context);
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/$endpoint"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );
      _hideLoader(context);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Failed to post data: ${response.statusCode}");
      }
    } catch (e) {
      _hideLoader(context);
      throw Exception("Error: $e");
    }
  }

  // Show an impressive Loader
  static void _showLoader(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Color.alphaBlend(Colors.grey.withAlpha(600), Colors.transparent),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(anim),
            child: child,
          ),
        );
      },
    );
  }

  // Hide Loader
  static void _hideLoader(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
