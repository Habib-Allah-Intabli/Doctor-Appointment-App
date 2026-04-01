// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleAvatarInDoctorDetailsView extends StatelessWidget {
  IconData icon;
  String value;
  String label;
  CircleAvatarInDoctorDetailsView({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xffF3F4F6),
          radius: 25,
          child: Icon(icon, color: const Color(0xff1C2A3A), size: 30),
        ),
        SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff4B5563),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xff6B7280),
          ),
        ),
      ],
    );
  }
}
