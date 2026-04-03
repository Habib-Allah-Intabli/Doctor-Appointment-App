// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hospital_bloc.dart';

enum HospitalStatus { initial, success, failure, loading }

// ignore: must_be_immutable
class HospitalState extends Equatable {
  List<HospitalModel> hospitals;
  HospitalStatus status;
  String? errorMessage;
  HospitalState({
    this.hospitals = const [],
    this.status = HospitalStatus.initial,
    this.errorMessage,
  });

  HospitalState copyWith({
    List<HospitalModel>? hospitals,
    HospitalStatus? status,
    String? errorMessage,
  }) {
    return HospitalState(
      hospitals: hospitals ?? this.hospitals,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [hospitals, status, errorMessage];
}
