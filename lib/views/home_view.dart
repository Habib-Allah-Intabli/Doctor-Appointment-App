import 'package:final_project/views/search_view.dart';
import 'package:final_project/widget/page_view_in_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Color(0xff1C2A3A), size: 20),
                SizedBox(width: 4),
                Text(
                  'Seattle, USA',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A1A2E),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff1A1A2E),
                  size: 18,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            child: Container(
              width: 355.w,
              height: 50.h,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF3F4F6),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Color(0xff9CA3AF), size: 20),
                  SizedBox(width: 12.w),
                  Text(
                    'Search doctor...',
                    style: TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 450.w,
            height: 240.h,
            child: PageView(
              controller: controller,
              children: [
                PageViewInHomeView(controller: controller),
                PageViewInHomeView(controller: controller),
                PageViewInHomeView(controller: controller),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1A1A2E),
                  ),
                ),
                SizedBox(height: 12),
                // _buildDoctorCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
