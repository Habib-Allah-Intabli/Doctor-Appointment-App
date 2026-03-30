import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 442.w,
            height: 888.h,
            child: Stack(
              children: [
                Image.asset('assets/images/background_splash.png'),
                Center(child: Image.asset('assets/images/logo.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
