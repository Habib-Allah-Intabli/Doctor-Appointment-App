import 'package:final_project/models/cart_doctor_model.dart';
import 'package:final_project/models/doctors_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartLocalDataSource {
  Future<void> saveDoctors({required List<CartDoctorModel> cartDoctors}) async {
    final box = await Hive.openBox('shopping_cart');
    List<Map<dynamic, dynamic>> cartDoctorsMaps = List.generate(cartDoctors.length, (
      index,
    ) {
      return cartDoctors[index].toMap();
    });
    box.put('cart_list', cartDoctorsMaps);
  }

  Future<List<CartDoctorModel>> getDoctorsToShowInCart() async {
    final box = await Hive.openBox('shopping_cart');
    final data = await box.get('cart_list');
    // print(data);
    if (data != null) {
      List<CartDoctorModel> cartDoctors = List.generate(data.length, (index) {
        return CartDoctorModel.fromMap(
  Map<dynamic, dynamic>.from(data[index]), );
      });
      return cartDoctors;
    } else {
      return [];
    }
  }
}
