import 'package:final_project/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCartInDoctorDetailsView extends StatelessWidget {
  const DoctorCartInDoctorDetailsView({super.key, required this.doctor});

  final DoctorsModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 140,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 6,
            color: Colors.black.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Container(
        // margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                doctor.image,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 109.w,
                  height: 109.h,
                  color: Colors.grey.shade200,
                  child: Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13),
                  SizedBox(
                    width: 140.w,
                    height: 24.h,
                    child: Expanded(
                      child: Text(
                        doctor.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1F2A37),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1, color: Color(0xffE5E7EB)),
                  Text(
                    doctor.specialization,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4B5563),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 17.sp,
                        color: Color(0xff4B5563),
                      ),
                      SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          doctor.location,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xff4B5563),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
