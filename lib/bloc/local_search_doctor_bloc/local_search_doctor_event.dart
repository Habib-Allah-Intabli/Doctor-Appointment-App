part of 'local_search_doctor_bloc.dart';

sealed class LocalSearchDoctorEvent extends Equatable {
  const LocalSearchDoctorEvent();

  @override
  List<Object> get props => [];
}

class GetAllDoctors extends LocalSearchDoctorEvent{}
