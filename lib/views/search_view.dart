import 'package:final_project/bloc/local_search_doctor_bloc/local_search_doctor_bloc.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/widget/doctors_cart_in_search_view.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                                itemBuilder: (context, index) {
                                  final doctor = state.doctors[index];
                                  return DoctorsCartInSearchView(doctor: doctor);
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
