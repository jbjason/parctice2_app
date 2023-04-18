import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class DocDInfoItem4 extends StatelessWidget {
  const DocDInfoItem4({required this.doctor, super.key});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doctor.ratings.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                    fontSize: 35,
                  ),
                ),
                const Text('★★★★☆'),
                getSubTitleText('(10)', homeAppBar),
              ],
            ),
            const SizedBox(width: 20),
            Container(
              width: 1.5,
              height: 100,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [for (int i = 5; i > 0; i--) Text(getStar(i))],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ...List.generate(
          4,
          (index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(doctor.img),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitleText(doctor.title, homeSecondary),
                        getSubTitleText('March 21, 2021', Colors.grey),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                getSubTitleText(
                  'I would like to show the world today as an ant sees it and tomorrow as the moon sees it.',
                  Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getStar(int i) => '★' * i + '☆' * (5 - i);
}
