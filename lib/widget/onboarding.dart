import 'package:final_project/bloc/user_session_bloc/user_session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
    required this.onboardingImage,
    required this.onboardingTitle,
    required this.onboardingSubtitle,
    required this.controller,
    this.isLast = false,
  });

  final String onboardingImage;
  final String onboardingTitle;
  final String onboardingSubtitle;
  final PageController controller;
  final dynamic isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(onboardingImage),
        Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 8),
          child: SizedBox(
            width: 311,
            height: 25,
            child: Text(
              onboardingTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          width: 311,
          height: 61,
          child: Text(
            onboardingSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff6B7280),
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 8),
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff1C2A3A)),
            fixedSize: WidgetStatePropertyAll(Size(311, 40)),
          ),
          onPressed: () {
            if (isLast) {
              context.read<UserSessionBloc>().add(CompleteOnboarding());
            } else {
              controller.nextPage(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text('Next', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
