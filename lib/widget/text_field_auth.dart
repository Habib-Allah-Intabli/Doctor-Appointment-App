// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  String hint;
  IconData icon;
  TextInputType keyboardType = TextInputType.text;
  bool obscureText;
  TextEditingController controller;
  TextFieldAuth({
    Key? key,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 18),
        filled: true,
        fillColor: Color(0xffF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // ← بدون border عادي
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // ← بدون border عند الضغط
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14),
      ),
    );
    // return TextField(
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(12),
    //       // borderSide: BorderSide.,
    //     ),
    //   ),
    // );
  }
}
