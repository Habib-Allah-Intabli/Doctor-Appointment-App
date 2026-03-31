part of 'local_search_doctor_bloc.dart';

sealed class LocalSearchDoctorEvent extends Equatable {
  const LocalSearchDoctorEvent();

  @override
  List<Object> get props => [];
}

class GetAllDoctors extends LocalSearchDoctorEvent {}

final class SearchDoctor extends LocalSearchDoctorEvent {
  final String query;

  SearchDoctor({required this.query});
}
