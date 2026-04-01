import 'package:final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:final_project/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showBottomSheetLogout(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      final authBloc = context.read<AuthBloc>();
      return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => SignInView()),
              (route) => false,
            );
          } else if (state is AuthError) {}
        },
        builder: (context, state) {
          return Container(
            width: double.maxFinite,
            height: 200.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            child: state is AuthLoading
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1C2A3A),
                            ),
                          ),
                        ),
                        // SizedBox(height: 32),
                        Container(
                          width: 250,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            thickness: 1,
                            color: Color(0xffE5E7EB),
                          ),
                        ),
                        Text(
                          'Are you sure you want to log out?',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(200.w, 41.h),
                                  backgroundColor: Color(0xffE5E7EB),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Color(0xff1C2A3A),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  authBloc.add(SignOut());
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(200.w, 41.h),
                                  backgroundColor: Color(0xff1C2A3A),
                                ),
                                child: Text(
                                  'Yes, Logout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
    },
  );
}
