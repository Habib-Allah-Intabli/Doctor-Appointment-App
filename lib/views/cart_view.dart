import 'package:final_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:final_project/models/cart_doctor_model.dart';
import 'package:final_project/views/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NavBarView();
                },
              ),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xffF8F8F8),
        centerTitle: true,
        title: Text(
          'My Bookings',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff1A1A2E),
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          switch (state) {
            case CartLoading():
              return Center(child: CircularProgressIndicator());
            case CartEmpty():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Bookings Yet',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A2E),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Book an appointment with a doctor',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              );

            case CartLoaded():
              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: state.cartDoctors.length,
                itemBuilder: (context, index) {
                  final item = state.cartDoctors[index];
                  return _buildBookingCard(context, item);
                },
              );
          }
        },
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, CartDoctorModel item) {
    final doctor = item.doctor;
    final date = 'May 22, 2023';
    final time = '10:00 AM';

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
            ),
            child: Text(
              '$date - $time',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1A1A2E),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    doctor.image,
                    width: 64.w,
                    height: 72.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 64.w,
                      height: 72.h,
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
                      Text(
                        doctor.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1A1A2E),
                        ),
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
                            Icons.location_on_outlined,
                            size: 12,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              doctor.location,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey.shade400,
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

          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              width: double.infinity,
              height: 40.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1A1A2E),
                  shape: StadiumBorder(),
                  elevation: 0,
                ),
                onPressed: () {
                  context.read<CartBloc>().add(
                    RemoveFromCart(cartDoctorModel: item),
                  );
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
