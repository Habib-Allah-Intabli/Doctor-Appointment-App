import 'package:final_project/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:final_project/models/doctor_model.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsCardInHomeView extends StatelessWidget {
  const DoctorsCardInHomeView({super.key, required this.doctor});

  final DoctorsModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 155.h,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.05),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
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
                    width: 109.w,
                    height: 109.h,
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
                      SizedBox(
                        width: 197.w,
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4B5563),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 15.sp,
                            color: Color(0xff4B5563),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              doctor.location,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff4B5563),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xffFFE0BA), size: 13),
                          SizedBox(width: 3),
                          Text(
                            '${doctor.rating}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B7280),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${doctor.reviews.length} Reviews',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B7280),
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

          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoaded) {
                bool isFav = state.doctors.any((item) {
                  return item.id == doctor.id;
                });
                return Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      print("button clicked");
                      context.read<FavoriteBloc>().add(
                        ToggleFavorite(doctors: doctor),
                      );
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_outline,
                      size: 21,
                      color: Color(0xff1F2A37),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
