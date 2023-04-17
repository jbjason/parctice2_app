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
        boxShadow: homeShadow,
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
                    width: 2.6,
                    height: 60,
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
                          fontWeight: FontWeight.bold,
                          color: Color(0xB3FFFFFF),
                        ),
                      ),
                      const Text(
                        'Medicine & Hear Specialist',
                        style: TextStyle(fontSize: 9, color: Color(0xB3FFFFFF)),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2.5,
                        ),
                        color: homeAppBar,
                        child: const Text(
                          'Good Health Clinic',
                          style:
                              TextStyle(fontSize: 10, color: Color(0xB3FFFFFF)),
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
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
}
