import 'package:final_project/bloc/hospital_bloc/hospital_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HospitalCardInHomeView extends StatelessWidget {
  const HospitalCardInHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalBloc, HospitalState>(
      builder: (context, state) {
        switch (state.status) {
          case HospitalStatus.initial:
          case HospitalStatus.loading:
            return Center(child: CircularProgressIndicator());
          case HospitalStatus.success:
            return SizedBox(
              width: double.maxFinite,
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = state.hospitals[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 232.w,
                    height: 220.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            hospital.image,
                            width: 232.w,
                            height: 121.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          hospital.name,
                          style: TextStyle(
                            color: Color(0xff4B5563),
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xff6B7280),
                                size: 12.sp,
                              ),
                              Text(
                                hospital.location,
                                style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                hospital.rating.toString(),
                                style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xffFEB052),
                                size: 12.sp,
                              ),
                              Text(
                                '(${hospital.reviews_count}Reviews)',
                                style: TextStyle(
                                  color: Color(0xff6B7280),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 1, color: Color(0xffE5E7EB)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.route_outlined,
                                  color: Color(0xff9CA3AF),
                                  size: 16.sp,
                                ),
                                Text(
                                  hospital.distance,
                                  style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_hospital_outlined,
                                  color: Color(0xff9CA3AF),
                                  size: 12.sp,
                                ),
                                Text(
                                  'Hospital',
                                  style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          case HospitalStatus.failure:
            return Center(child: Text(state.errorMessage!));
        }
      },
    );
  }
}
