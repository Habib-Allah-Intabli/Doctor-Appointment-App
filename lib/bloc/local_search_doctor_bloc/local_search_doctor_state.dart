// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'local_search_doctor_bloc.dart';

enum LocalSearchStatus { initial, success, failure, loading }

class LocalSearchDoctorState extends Equatable {
  final List<DoctorsModel> doctors;
  final LocalSearchStatus status;
  final String? errorMessage;
  const LocalSearchDoctorState({
    this.doctors = const [],
    this.status = LocalSearchStatus.initial,
    this.errorMessage,
  });

  LocalSearchDoctorState copyWith({
    List<DoctorsModel>? doctors,
    LocalSearchStatus? status,
    String? errorMessage,
  }) {
    return LocalSearchDoctorState(
      doctors: doctors ?? this.doctors,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [doctors, status, errorMessage];
}
