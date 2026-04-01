import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/doctor_model.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/service/doctors_service.dart';

part 'local_search_doctor_event.dart';
part 'local_search_doctor_state.dart';

class LocalSearchDoctorBloc
    extends Bloc<LocalSearchDoctorEvent, LocalSearchDoctorState> {
  List<DoctorsModel> allDoctors = [];
  LocalSearchDoctorBloc()
    : super(
        LocalSearchDoctorState(doctors: [], status: LocalSearchStatus.initial),
      ) {
    on<GetAllDoctors>((event, emit) async {
      emit(state.copyWith(status: LocalSearchStatus.loading));
      List<DoctorsModel>? result = await getIt.get<DoctorsService>().getAll();
      if (result != null) {
        allDoctors = result;
        emit(
          state.copyWith(
            status: LocalSearchStatus.success,
            doctors: allDoctors,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: LocalSearchStatus.failure,
            errorMessage: 'Failed to load doctors',
          ),
        );
      }
    });
    on<SearchDoctor>((event, emit) {
      if (event.query.isNotEmpty) {
        final filtered = allDoctors
            .where(
              (doctor) =>
                  doctor.name.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ) ||
                  doctor.specialization.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ),
            )
            .toList();
        emit(
          state.copyWith(status: LocalSearchStatus.success, doctors: filtered),
        );
      } else {
        emit(
          state.copyWith(
            status: LocalSearchStatus.success,
            doctors: allDoctors, // ← رجّع الكل
          ),
        );
      }
    });
  }
}
