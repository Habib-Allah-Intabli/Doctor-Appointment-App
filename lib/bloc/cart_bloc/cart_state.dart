// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartDoctorModel> cartDoctors;
  // final double totalPrice;
  const CartLoaded({
    required this.cartDoctors,
    // required this.totalPrice,
  });
}

class CartEmpty extends CartState {}
