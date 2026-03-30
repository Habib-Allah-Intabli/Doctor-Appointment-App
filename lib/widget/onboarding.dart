// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project/bloc/user_session_bloc/user_session_bloc.dart';
import 'package:final_project/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class onboarding extends StatelessWidget {
  const onboarding({
    Key? key,
    required this.onboarding_image,
    required this.onboarding_title,
    required this.onboarding_subtitle,
    required this.controller,
    this.isLast = false,
  }) : super(key: key);

  final String onboarding_image;
  final String onboarding_title;
  final String onboarding_subtitle;
  final PageController controller;
  final isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(onboarding_image),
        Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 8),
          child: SizedBox(
            width: 311,
            height: 25,
            child: Text(
              onboarding_title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          width: 311,
          height: 61,
          child: Text(
            onboarding_subtitle,
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
            if (isLast) { context.read<UserSessionBloc>().add(CompleteOnboarding());
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
