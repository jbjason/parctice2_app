import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/soow_home.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Text('Search doctor', style: homeTextStyle),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(4.5),
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: homeGradient,
              borderRadius: BorderRadius.circular(18),
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
