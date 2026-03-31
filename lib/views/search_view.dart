import 'package:final_project/bloc/local_search_doctor_bloc/local_search_doctor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalSearchDoctorBloc()..add(GetAllDoctors()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Center(child: Text('All Doctors')),
              ),
            ),
            body: Container(
              color: Colors.white,
              // padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search doctor...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                        size: 18,
                      ),
                      filled: true,
                      fillColor: Color(0xffF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 13),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<LocalSearchDoctorBloc, LocalSearchDoctorState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case LocalSearchStatus.initial:
                          case LocalSearchStatus.success:
                            if (state.doctors.isEmpty) {
                              return Center(child: Text('No doctors found'));
                            } else {
                              return ListView.builder(
                                itemCount: state.doctors.length,
                                // padding: EdgeInsets.symmetric(vertical: 8),
                                itemBuilder: (context, index) {
                                  final doctor = state.doctors[index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // ===== الصورة 109x109 =====
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.network(
                                              doctor.image,
                                              width:
                                                  109.w, // ← الحجم اللي تريده
                                              height: 109.h,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Container(
                                                    width: 109.w,
                                                    height: 109.h,
                                                    color: Colors.grey.shade200,
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                            ),
                                          ),

                                          SizedBox(width: 12),

                                          // ===== المعلومات =====
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        doctor.name,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color(
                                                            0xff1A1A2E,
                                                          ),
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          Colors.grey.shade300,
                                                      size: 18,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  doctor.specialization,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 12,
                                                      color: Color(0xff4B5563),
                                                    ),
                                                    SizedBox(width: 2),
                                                    Expanded(
                                                      child: Text(
                                                        doctor.location,
                                                        style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: Colors
                                                              .grey
                                                              .shade400,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 13,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      '${doctor.rating}',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color(
                                                          0xff1A1A2E,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      '${doctor.reviews.length} Reviews',
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: Colors
                                                            .grey
                                                            .shade400,
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
                                },
                              );
                            }
                          case LocalSearchStatus.failure:
                            return Center(child: Text(state.errorMessage!));
                          case LocalSearchStatus.loading:
                            return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
