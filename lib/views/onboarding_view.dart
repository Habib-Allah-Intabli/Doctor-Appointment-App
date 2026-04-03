import 'package:final_project/bloc/user_session_bloc/user_session_bloc.dart';
import 'package:final_project/widget/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final isLast = false;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: [
                Onboarding(
                  onboardingImage: 'assets/images/onboarding_image_1.png',
                  onboardingTitle: 'Meet Doctors Online',
                  onboardingSubtitle:
                      'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
                  controller: controller,
                ),
                Onboarding(
                  onboardingImage: 'assets/images/onboarding_image_2.png',
                  onboardingTitle: 'Connect with Specialists',
                  onboardingSubtitle:
                      'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
                  controller: controller,
                ),
                Onboarding(
                  onboardingImage: 'assets/images/onboarding_image_3.png',
                  onboardingTitle: 'Thousands of Online Specialists',
                  onboardingSubtitle:
                      ' Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.',
                  controller: controller,
                  isLast: true,
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              expansionFactor: 3.75,
              spacing: 8.w,
              activeDotColor: Color(0xff26232F),
              dotColor: Colors.grey,
            ),
          ),
          SizedBox(height: 14),
          TextButton(
            onPressed: () {
              context.read<UserSessionBloc>().add(CompleteOnboarding());
            },
            child: Text('Skip', style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
