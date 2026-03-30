import 'package:final_project/views/verify_code.dart';
import 'package:final_project/widget/text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Image.asset('assets/images/logo_sign_up.png'),
            SizedBox(height: 32.h),
            Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff1C2A3A),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Enter your Email, we will send you a verification code.',
              style: TextStyle(fontSize: 13, color: Color(0xff6B7280)),
            ),
            SizedBox(height: 32),
            TextFieldAuth(
              controller: email,
              hint: 'Your Email',
              icon: Icons.email_outlined,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1C2A3A),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VerifyCode();
                      },
                    ),
                  );
                },
                child: Text(
                  'Send Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
