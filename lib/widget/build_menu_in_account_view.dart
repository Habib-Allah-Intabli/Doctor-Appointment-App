// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildMenuInAccountView extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback ontap;
  const BuildMenuInAccountView({
    super.key,
    required this.icon,
    required this.label,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 4),
          onTap: ontap,
          leading: Icon(icon, color: Color(0xff1C2A3A), size: 24),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff6B7280),
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Color(0xff6B7280),
            size: 14,
          ),
        ),
        Divider(height: 1, color: Color(0xffE5E7EB)),
      ],
    );
  }
}
