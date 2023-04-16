import 'dart:math';
import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_widgets/home_appbar.dart';
import 'package:parctice2_app/widgets/home_widgets/home_category_grid.dart';
import 'package:parctice2_app/widgets/home_widgets/home_search_field.dart';

const homeAppBar = Color(0xFF01204E);
const homeAppBar1 = Color.fromARGB(255, 38, 75, 131);
final homeGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [homeAppBar, homeAppBar.withOpacity(.8), homeAppBar.withOpacity(.2)],
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
  Category(img: 'assets/category/cardiology.png', title: 'Cardiology'),
  Category(img: 'assets/category/dentist.png', title: 'Dentist'),
  Category(img: 'assets/category/dermathology.png', title: 'Dermathology'),
  Category(img: 'assets/category/neurology.png', title: 'Neurology'),
  Category(img: 'assets/category/nutrition.png', title: 'Nutrition'),
  Category(img: 'assets/category/psychology.png', title: 'Psychology'),
  Category(img: 'assets/category/pulmonary.png', title: 'Pulmonary'),
  Category(img: 'assets/category/urology.png', title: 'Urology'),
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          const HomeAppbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  // search textField
                  const HomeSearchField(),
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
                  const SizedBox(height: 20),
                  // offer box
                  Container(
                    height: 155,
                    decoration: BoxDecoration(
                      gradient: homeGradient,
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  const SizedBox(height: 35),
                  // categories text
                  const Text(
                    'Our Service',
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
          const HomeCategoryGrid(),
        ],
      ),
    );
  }
}
