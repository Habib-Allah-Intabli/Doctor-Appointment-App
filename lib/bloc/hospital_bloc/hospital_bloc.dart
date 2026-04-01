import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/hospital_model.dart';
import 'package:final_project/service/hospital_service.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  List<HospitalModel> allhospitals = [];
  HospitalBloc()
    : super(HospitalState(hospitals: [], status: HospitalStatus.initial)) {
    on<GetAllHospitals>((event, emit) async {
      emit(state.copyWith(status: HospitalStatus.loading));
      List<HospitalModel>? result = await getIt.get<HospitalService>().getAll();
      if (result != null) {
        allhospitals = result;
        emit(
          state.copyWith(
            status: HospitalStatus.success,
            hospitals: allhospitals,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: HospitalStatus.failure,
            errorMessage: 'Failed to load doctors',
          ),
        );
      }
    });
  }
}
