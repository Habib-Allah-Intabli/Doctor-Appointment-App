import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/map_image.png'),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 100),
            child: Image.asset('assets/images/location_image_1.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 250, top: 150),
            child: Image.asset('assets/images/location_image_2.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 310),
            child: Image.asset('assets/images/location_image_1.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Image.asset('assets/images/location_image_2.png'),
          ),
        ],
      ),
    );
  }
}
