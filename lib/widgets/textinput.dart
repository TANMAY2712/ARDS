import 'package:flutter/material.dart';
import 'palatte.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.controler,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  });

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.alphaBlend(Colors.black.withAlpha(600), Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: controler,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            hintStyle: kBodyText,
          ),
          style: kBodyText,
          cursorColor: Colors.white,
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
