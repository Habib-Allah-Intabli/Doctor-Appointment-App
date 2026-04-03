// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CreateAccountBySocialMedia extends StatelessWidget {
  final VoidCallback onTap;
  final String logo;
  final String text;
  const CreateAccountBySocialMedia({
    super.key,
    required this.onTap,
    required this.logo,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 342,
        height: 41,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(color: Color(0xffE5E7EB)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20, height: 20, child: Image.asset(logo)),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1A1A2E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
