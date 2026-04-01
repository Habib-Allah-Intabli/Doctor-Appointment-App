import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/models/doctor_model.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      switch (event) {
        case InitializeFavoriteList():
          {
            final box = await Hive.openBox<DoctorsModel>('favorite_key');
            List<DoctorsModel> doctors = box.values.toList();
            for (var doctor in doctors) {
              print(doctor.id);
            }
            emit(FavoriteLoaded(doctors: doctors));
          }
        case ToggleFavorite():
          final box = await Hive.openBox<DoctorsModel>('favorite_key');
          List<DoctorsModel> doctors = box.values.toList();
          print(doctors);
          DoctorsModel? exsitingDoctor;
          for (var doctor in doctors) {
            print("doctor exsit: ${doctor.id}");
            if (doctor.id == event.doctors.id) {
              exsitingDoctor = doctor;
              break;
            }
          }
          if (exsitingDoctor != null) {
            await exsitingDoctor.delete();
          } else {
            await box.add(event.doctors);
          }
          emit(FavoriteLoaded(doctors: box.values.toList()));
      }
    });
  }
}
