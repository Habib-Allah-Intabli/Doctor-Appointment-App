import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/config/di.dart';
import 'package:final_project/models/cart_doctor_model.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:final_project/service/cart_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartDoctorModel> cartDoctors = [];
  CartBloc() : super(CartLoading()) {
    on<CartEvent>((event, emit) async {
      switch (event) {
        case InitiliazeCart():
          {
            cartDoctors = await getIt
                .get<CartLocalDataSource>()
                .getDoctorsToShowInCart();
            if (cartDoctors.isEmpty) {
              emit(CartEmpty());
            } else {
              emit(CartLoaded(cartDoctors: cartDoctors));
            }
          }
        case AddToCart():
          {
            final exists = cartDoctors.any(
              (element) => element.doctor.id == event.cartDoctorModel.doctor.id,
            );
            if (!exists) {
              cartDoctors.add(event.cartDoctorModel);
              await getIt.get<CartLocalDataSource>().saveDoctors(
                cartDoctors: cartDoctors,
              );
            }
            emit(CartLoaded(cartDoctors: List.from(cartDoctors)));
          }
        case RemoveFromCart():
          {
            cartDoctors.removeWhere(
              (element) => element.doctor.id == event.cartDoctorModel.doctor.id,
            );
            await getIt.get<CartLocalDataSource>().saveDoctors(
              cartDoctors: cartDoctors,
            );

            if (cartDoctors.isEmpty) {
              emit(CartEmpty());
            } else {
              emit(CartLoaded(cartDoctors: List.from(cartDoctors)));
            }
          }
      }
    });
  }
}
