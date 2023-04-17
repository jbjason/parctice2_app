import 'dart:math';
import 'package:flutter/material.dart';

// const ashDark = Color(0xFFC4C8E5);
// const ashhLight = Color(0xFFD7D9EE);
// const buttonColor = Color(0xFFE7E9F6);
// const dFloatColor = Color(0xFF8F90F3);
// const clock2 = Color(0xFFCADBEB);
const homeAppBar = Color(0xFF01204E);
const homeSecondary = Color.fromARGB(255, 94, 111, 136);
const ashhLight = Color(0xFFECF6FF);

Gradient getHomeGradient(Color color) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        color.withOpacity(.9),
        color.withOpacity(.6),
        color.withOpacity(.4)
      ],
    );
final homeShadow = [
  BoxShadow(
    color: const Color(0xFF3F6080).withOpacity(.4),
    blurRadius: 32,
    offset: const Offset(10, 5),
  ),
  const BoxShadow(
    color: Color(0xFFFFFFFF),
    blurRadius: 32,
    offset: Offset(-10, -5),
  ),
];
const homeTextColor = Color(0xFF292F51);
Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

const bodyGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.white,
    Colors.white,
    Color(0xB3FFFFFF),
    Color(0x62FFFFFF),
  ],
);

final bodyShadow = [
  BoxShadow(
    color: const Color(0xFF3F6080).withOpacity(.4),
    blurRadius: 32,
    offset: const Offset(10, 5),
  ),
  BoxShadow(
    color: const Color(0xFFFFFFFF).withOpacity(1),
    blurRadius: 32,
    offset: const Offset(-10, -5),
  ),
];

class Category {
  final String title;
  final String img;
  const Category({required this.img, required this.title});
}

class Doctor {
  final String title;
  final String subtitle;
  final String img;
  final String location;
  final String schedule;
  final double fees;
  final int review;

  const Doctor({
    required this.title,
    required this.subtitle,
    required this.img,
    required this.location,
    required this.schedule,
    required this.fees,
    required this.review,
  });
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

const doctors = [
  Doctor(
    title: 'Prof. Dr. Kevin Williams',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc1.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Prof. Dr. Saif Rahman',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc2.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Dr. Shariful Islam',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc3.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Prof. Dr. Jb Jason',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc4.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Dr. Tarikul Islam',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc5.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
];

Widget getTitleSeeAllText(String title, Function onTap) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: homeTextColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => onTap,
          child: const Text(
            'See More',
            style: TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );

Widget getDoctorCategory(String title) => Container(
      padding: const EdgeInsets.only(left: 7, top: 2.5, bottom: 2.5, right: 14),
      decoration: const BoxDecoration(
        color: homeAppBar,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(4),
          right: Radius.circular(14),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
    );

Widget getTitleText(String title, Color color) => Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold, color: color),
    );

Widget getSubTitleText(String title, Color color) => Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 9.5, color: color),
    );
