import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class HomeBOfferContainer extends StatelessWidget {
  const HomeBOfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: homeGradient,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Stack(
        children: [
          // doctor & title text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _offerText('Looking For Your Desire'),
              _offerText('Specialist Doctor ?'),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 3,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3D00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dr. Al Jubayer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const Text(
                        'Medicine & Hear Specialist',
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2.5),
                        color: homeAppBar,
                        child: const Text(
                          'Good Health Clinic',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          // doctor img
          Positioned(
            right: -30,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/doctor/doc2.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _offerText(String title) => Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
}
