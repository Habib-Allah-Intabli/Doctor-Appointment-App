import 'package:final_project/views/create_new_password.dart';
import 'package:final_project/widget/text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController code = TextEditingController();
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
              'Verify Code',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff1C2A3A),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Enter the code \nwe just sent you on your registered Email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Color(0xff6B7280)),
            ),
            TextFieldAuth(
              controller: code,
              hint: 'Enter the code',
              icon: Icons.health_and_safety_sharp,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1C2A3A),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CreateNewPassword();
                      },
                    ),
                  );
                },
                child: Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn’t get the Code? ',
                  style: TextStyle(color: Color(0xff6B7280), fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Resend ',
                    style: TextStyle(
                      color: Color(0xff1C64F2),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
