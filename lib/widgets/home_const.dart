import 'dart:math';
import 'package:flutter/material.dart';

const ashDark = Color(0xFFC4C8E5);
const ashhLight = Color(0xFFD7D9EE);
const buttonColor = Color(0xFFE7E9F6);
const dFloatColor = Color(0xFF8F90F3);
const homeAppBar = Color(0xFF01204E);
final homeGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    homeAppBar.withOpacity(.9),
    homeAppBar.withOpacity(.6),
    homeAppBar.withOpacity(.4)
  ],
);
const homeTextColor = Color(0xFF292F51);
Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

const bodyGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.white,
    Color(0xB3FFFFFF),
    Color(0x62FFFFFF),
  ],
);

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
    title: 'Prof. Dr. Kevin Williams',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc2.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Prof. Dr. Kevin Williams',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc3.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Prof. Dr. Kevin Williams',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc4.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
  Doctor(
    title: 'Prof. Dr. Kevin Williams',
    subtitle: 'Heart Sergon',
    img: 'assets/doctor/doc5.png',
    location: 'Mirpur-Dhaka',
    schedule: '10.00 am - 3.20pm',
    fees: 550,
    review: 3,
  ),
];

Widget titleSeeAllText(String title, Function onTap) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: homeTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => onTap,
          child: const Text(
            'See More',
            style: TextStyle(color: homeAppBar, fontSize: 10),
          ),
        ),
      ],
    );
