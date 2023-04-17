import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class SoowDescription extends StatelessWidget {
  static const routeName = '/soow-description';
  const SoowDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = doctors[0];
    return Scaffold(
      backgroundColor: ashhLight,
      body: CustomScrollView(
        slivers: [
          // appBar
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new, color: homeAppBar),
            ),
            title:
                const Text('Description', style: TextStyle(color: homeAppBar)),
            actions: [
              Row(
                children: [
                  const SizedBox(
                    height: 8,
                    width: 8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    ),
                  ),
                  const SizedBox(width: 5),
                  getSubTitleText('Active Now', homeAppBar),
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(doctor.img),
                              fit: BoxFit.contain),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTitleText(doctor.title, homeAppBar),
                          getDoctorCategory(doctor.subtitle),
                          const SizedBox(height: 5),
                          getSubTitleText('Govt. Bangla Hostpital',
                              const Color(0xFFBDBDBD)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getSubTitleText(
                              'Experience', const Color(0xFFBDBDBD)),
                          const SizedBox(height: 5),
                          const Text('5+ years'),
                        ],
                      ),
                      Container(
                          height: 30, width: 2, color: const Color(0xFFD6D6D6)),
                      Column(
                        children: [
                          getSubTitleText('Reviews', const Color(0xFFBDBDBD)),
                          const SizedBox(height: 5),
                          const Text('★4.5 (20)'),
                        ],
                      ),
                      Container(
                          height: 30, width: 2, color: const Color(0xFFD6D6D6)),
                      Column(
                        children: [
                          getSubTitleText('Location', const Color(0xFFBDBDBD)),
                          const SizedBox(height: 5),
                          const Text('Mirpur, Dhaka'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
