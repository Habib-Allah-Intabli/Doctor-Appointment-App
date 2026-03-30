import 'package:final_project/widget/onboarding.dart';
import 'package:flutter/material.dart';
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
                onboarding(
                  onboarding_image: 'assets/images/onboarding_image_1.png',
                  onboarding_title: 'Meet Doctors Online',
                  onboarding_subtitle:
                      'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
                  controller: controller,
                ),
                onboarding(
                  onboarding_image: 'assets/images/onboarding_image_2.png',
                  onboarding_title: 'Connect with Specialists',
                  onboarding_subtitle:
                      'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.',
                  controller: controller,
                ),
                onboarding(
                  onboarding_image: 'assets/images/onboarding_image_3.png',
                  onboarding_title: 'Thousands of Online Specialists',
                  onboarding_subtitle:
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
            onPressed: () {},
            child: Text('Skip', style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
