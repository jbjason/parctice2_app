import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/soow_home.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 10,
      title: Image.asset('assets/welcome_logo.png',
          height: 60, width: size.width * .4, fit: BoxFit.contain),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined, color: homeAppBar),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/people_logo.jpg'),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
