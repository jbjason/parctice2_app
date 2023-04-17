import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      decoration: BoxDecoration(
        gradient: bodyGradient,
        borderRadius: BorderRadius.circular(14),
        boxShadow: bodyShadow,
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Text(
            'Search doctor',
            style: TextStyle(
              color: Color(0xFFE0E0E0),
              fontSize: 14,
              letterSpacing: 1.3,
              wordSpacing: 1.5,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(4.5),
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: homeGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
