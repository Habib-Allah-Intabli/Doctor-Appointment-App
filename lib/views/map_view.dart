import 'package:final_project/bloc/bloc/hospital_bloc.dart';
import 'package:final_project/widget/hospital_card_in_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalBloc()..add(GetAllHospitals()),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/map_image.png'),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 100),
              child: Image.asset('assets/images/location_image_1.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250, top: 150),
              child: Image.asset('assets/images/location_image_2.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 310),
              child: Image.asset('assets/images/location_image_1.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Image.asset('assets/images/location_image_2.png'),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: 500.w,
                height: 290.h,
                child: HospitalCardInHomeView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
