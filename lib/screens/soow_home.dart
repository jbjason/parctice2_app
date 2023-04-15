import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const homeAppBar = Color(0xFF01204E);
const homeAppBar1 = Color.fromARGB(255, 38, 75, 131);
final homeGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    homeAppBar,
    homeAppBar1.withOpacity(.5),
    homeAppBar1.withOpacity(.05)
  ],
);
const homeTextColor = Colors.black54;
const homeTextStyle = TextStyle(
  color: Color(0xFFE0E0E0),
  fontSize: 14,
  letterSpacing: 1.3,
  wordSpacing: 1.5,
);
Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class Category {
  final String title;
  final String img;
  const Category({required this.img, required this.title});
}

const categories = [
  Category(img: 'assets/cardiology.png', title: 'Cardiology'),
  Category(img: 'assets/dentist.png', title: 'Dentist'),
  Category(img: 'assets/dermathology.png', title: 'Dermathology'),
  Category(img: 'assets/neurology.png', title: 'Neurology'),
  Category(img: 'assets/nutrition.png', title: 'Nutrition'),
  Category(img: 'assets/psychology.png', title: 'Psychology'),
  Category(img: 'assets/pulmonary.png', title: 'Pulmonary'),
  Category(img: 'assets/urology.png', title: 'Urology'),
];

class SooHome extends StatefulWidget {
  static const routeName = '/soo-home';
  const SooHome({super.key});

  @override
  State<SooHome> createState() => _SooHomeState();
}

class _SooHomeState extends State<SooHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          const SHAppbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // search textField
                  Container(
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
                  ),
                  const SizedBox(height: 35),
                  // upcoming-schedule text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Upcoming Schedule',
                        style: TextStyle(
                          color: homeTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(color: homeAppBar, fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // offer box
                  Container(
                    height: 155,
                    decoration: BoxDecoration(
                      gradient: homeGradient,
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Categories',
                    style: TextStyle(
                      color: homeTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SHAppbar extends StatelessWidget {
  const SHAppbar({super.key});
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
