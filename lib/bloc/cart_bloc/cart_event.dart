// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class InitiliazeCart extends CartEvent {}

class AddToCart extends CartEvent {
  final CartDoctorModel cartDoctorModel;
  const AddToCart({required this.cartDoctorModel});
}

class RemoveFromCart extends CartEvent {
  final CartDoctorModel cartDoctorModel;
  const RemoveFromCart({required this.cartDoctorModel});
}
