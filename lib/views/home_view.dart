// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project/bloc/bloc/hospital_bloc.dart';
import 'package:final_project/views/doctor_details_view.dart';
import 'package:final_project/widget/hospital_card_in_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:final_project/bloc/local_search_doctor_bloc/local_search_doctor_bloc.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/views/search_view.dart';
import 'package:final_project/widget/doctors_card_in_search_view.dart';
import 'package:final_project/widget/page_view_in_home_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalSearchDoctorBloc()..add(GetAllDoctors()),
        ),
        BlocProvider(
          create: (context) => HospitalBloc()..add(GetAllHospitals()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff1C2A3A),
                          size: 20,
                        ),
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
                      width: 400.w,
                      height: 50.h,
                      margin: EdgeInsets.only(bottom: 2),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffF3F4F6),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xff9CA3AF),
                            size: 20,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Search doctor...',
                            style: TextStyle(
                              color: Color(0xff9CA3AF),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 450.w,
                    height: 189.h,
                    child: PageView(
                      controller: controller,
                      children: [
                        PageViewInHomeView(controller: controller),
                        PageViewInHomeView(controller: controller),
                        PageViewInHomeView(controller: controller),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      'Doctors',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  BlocBuilder<LocalSearchDoctorBloc, LocalSearchDoctorState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case LocalSearchStatus.initial:
                        case LocalSearchStatus.loading:
                          return Center(child: CircularProgressIndicator());
                        case LocalSearchStatus.success:
                          return SizedBox(
                            width: double.maxFinite,
                            height: 165.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                final doctor = state.doctors[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorDetailsView(doctor: doctor),
                                      ),
                                    );
                                  },
                                  child: DoctorsCardInSearchView(
                                    doctor: doctor,
                                  ),
                                );
                              },
                            ),
                          );
                        case LocalSearchStatus.failure:
                          return Center(child: Text(state.errorMessage!));
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Nearby Medical Centers',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  HospitalCardInHomeView(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
