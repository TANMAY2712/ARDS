import 'package:flutter/material.dart';

import 'palatte.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.controler,
    required this.icon,
    required this.hint,
    required this.inputAction,
  });
  final IconData icon;
  final String hint;
  final TextInputAction inputAction;
  final TextEditingController controler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.alphaBlend(Colors.grey.withAlpha(51), Colors.transparent),
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
          obscureText: true,
          style: kBodyText,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
