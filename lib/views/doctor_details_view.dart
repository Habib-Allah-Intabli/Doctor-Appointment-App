import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/views/book_appointment.dart';
import 'package:final_project/views/nav_bar_view.dart';
import 'package:final_project/widget/circle_avatar_in_doctor_details_view.dart';
import 'package:final_project/widget/doctor_card_in_doctor_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsView extends StatelessWidget {
  final DoctorsModel doctor;
  const DoctorDetailsView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NavBarView();
              },
            ),
          ),
          icon: Icon(Icons.arrow_back, color: Color(0xff1A1A2E)),
        ),
        title: Text(
          'Doctor Details',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff1A1A2E),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border, color: Color(0xff1A1A2E)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DoctorCardInDoctorDetailsView(doctor: doctor),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                  height: 90,
                  child: CircleAvatarInDoctorDetailsView(
                    icon: Icons.people,
                    value: '${doctor.patientsCount}+',
                    label: 'patients',
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 90,
                  child: CircleAvatarInDoctorDetailsView(
                    icon: Icons.access_time_outlined,
                    value: '${doctor.experienceRate}+',
                    label: 'experience',
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 90,
                  child: CircleAvatarInDoctorDetailsView(
                    icon: Icons.star,
                    value: '${doctor.rating}',
                    label: 'rating',
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 90,
                  child: CircleAvatarInDoctorDetailsView(
                    icon: Icons.chat_bubble_outline,
                    value: '${doctor.reviews.length}',
                    label: 'reviews',
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About me',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1A1A2E),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    doctor.about,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xff6B7280),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Working Time',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1A1A2E),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    doctor.workingtime,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xff6B7280),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1A1A2E),
                    ),
                  ),
                  SizedBox(height: 12),
                  ...doctor.reviews.map(
                    (review) => Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey.shade200,
                            child: Text(
                              review.username[0],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A1A2E),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.username,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A1A2E),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: List.generate(
                                    5,
                                    (i) => Icon(
                                      Icons.star,
                                      size: 12,
                                      color: i < review.rating
                                          ? Colors.amber
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  review.reviewBody,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Color(0xff6B7280),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1A1A2E),
              shape: StadiumBorder(),
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BookAppointment(doctor: doctor);
                  },
                ),
              );
            },
            child: Text(
              'Book Appointment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
