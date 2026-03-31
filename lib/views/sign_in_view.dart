import 'package:final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:final_project/models/auth_model.dart';
import 'package:final_project/views/forget_password_view.dart';
import 'package:final_project/views/nav_bar_view.dart';
import 'package:final_project/views/sign_up_view.dart';
import 'package:final_project/widget/create_account_by_social_media.dart';
import 'package:final_project/widget/text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset('assets/images/logo_sign_up.png'),
            SizedBox(height: 32),
            Text(
              'Hi, Welcome Back! ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff1C2A3A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Hope you’re doing fine.',
              style: TextStyle(fontSize: 13, color: Color(0xff6B7280)),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: 342,
              height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
            SizedBox(height: 24),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NavBarView();
                      },
                    ),
                  );
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1C2A3A),
                      ),
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            authModel: AuthModel(
                              email: email.text,
                              password: password.text,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(color: Color(0xffE5E7EB))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'or',
                    style: TextStyle(color: Color(0xff6B7280), fontSize: 13),
                  ),
                ),
                Expanded(child: Divider(color: Color(0xffE5E7EB))),
              ],
            ),
            CreateAccountBySocialMedia(
              onTap: () {},
              logo: 'assets/images/google_logo.png',
              text: 'Continue With Google',
            ),
            SizedBox(height: 8),
            CreateAccountBySocialMedia(
              onTap: () {},
              logo: 'assets/images/facebook_logo.png',
              text: 'Continue With Facebook',
            ),
            SizedBox(height: 23),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgetPasswordView();
                    },
                  ),
                );
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: Color(0xff1C64F2),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account yet? ',
                  style: TextStyle(color: Color(0xff6B7280), fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpView();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
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
