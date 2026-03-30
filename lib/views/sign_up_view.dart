import 'package:final_project/views/sign_in_view.dart';
import 'package:final_project/widget/create_account_by_social_media.dart';
import 'package:final_project/widget/text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Image.asset('assets/images/logo_sign_up.png'),
            SizedBox(height: 32.h),
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff1C2A3A),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'We are here to help you!',
              style: TextStyle(fontSize: 13.sp, color: Color(0xff6B7280)),
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 342.w,
              height: 200.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldAuth(
                    controller: name,
                    hint: 'Your Name',
                    icon: Icons.person_outline,
                  ),
                  TextFieldAuth(
                    controller: email,
                    hint: 'Your Email',
                    icon: Icons.email_outlined,
                  ),
                  TextFieldAuth(
                    controller: password,
                    hint: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1C2A3A),
                ),
                onPressed: () {},
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(child: Divider(color: Color(0xffE5E7EB))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'or',
                    style: TextStyle(color: Color(0xff6B7280), fontSize: 13.sp),
                  ),
                ),
                Expanded(child: Divider(color: Color(0xffE5E7EB))),
              ],
            ),
            CreateAccountBySocialMedia(
              onTap: () {},
              logo: 'assets/image/google_logo.png',
              text: 'Continue With Google',
            ),
            SizedBox(height: 8.h),
            CreateAccountBySocialMedia(
              onTap: () {},
              logo: 'assets/image/facebook_logo.png',
              text: 'Continue With Facebook',
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do you have an account ? ',
                  style: TextStyle(color: Color(0xff6B7280), fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignInView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xff1C64F2),
                      fontSize: 13.sp,
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
