import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/doc_details/doc_info_list.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class DocDetailsScreen extends StatelessWidget {
  static const routeName = '/soow-description';
  const DocDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = doctors[0];
    final selectedIndex = ValueNotifier<int>(0);

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
            title: const Text('DR. Info', style: TextStyle(color: homeAppBar)),
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
          // body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // img
                      Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3.5),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(doctor.img),
                              fit: BoxFit.contain),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // title, specialities, place
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTitleText(doctor.title, homeAppBar),
                          const SizedBox(height: 8),
                          getDoctorCategory(doctor.subtitle),
                          const SizedBox(height: 10),
                          getSubTitleText('Govt. Bangla Hostpital',
                              const Color(0xFFBDBDBD)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Experience, reviews, Location
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
                          height: 35, width: 2, color: const Color(0xFFD6D6D6)),
                      Column(
                        children: [
                          getSubTitleText('Reviews', const Color(0xFFBDBDBD)),
                          const SizedBox(height: 5),
                          const Text('★4.5 (20)'),
                        ],
                      ),
                      Container(
                          height: 35, width: 2, color: const Color(0xFFD6D6D6)),
                      Column(
                        children: [
                          getSubTitleText('Location', const Color(0xFFBDBDBD)),
                          const SizedBox(height: 5),
                          const Text('Mirpur, Dhaka'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // doc-infoList
          SliverToBoxAdapter(child: DocInfoList(selectedIndex: selectedIndex)),
          SliverToBoxAdapter(child: DocInfoItems(selectedIndex: selectedIndex)),
        ],
      ),
    );
  }
}

class DocInfoItems extends StatelessWidget {
  const DocInfoItems({required this.selectedIndex, super.key});
  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    final infoItems = [
      const DocInfoItem1(),
      const Text('Clinic & Fees'),
      const Text('Schedule'),
      const Text('Reviews')
    ];
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, index, _) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: infoItems[index],
      ),
    );
  }
}

class DocInfoItem1 extends StatelessWidget {
  const DocInfoItem1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I would like to show the world today as an ant sees it and tomorrow as the moon sees it.' *
              2,
        ),
        const SizedBox(height: 20),
        getTitleText('Education History', homeAppBar),
        _getEducationHistory('Diploma in Pharmacy   (2020-2023)'),
        _getEducationHistory('FCPS   (2018-2020)'),
        _getEducationHistory('MBBS   (2015-2018)'),
        const SizedBox(height: 20),
        getTitleText('Specializations', homeAppBar),
        const SizedBox(height: 5),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              getDoctorCategory('Heart Sergery'),
              const SizedBox(width: 10),
              getDoctorCategory('Heart Mobility'),
              const SizedBox(width: 10),
              getDoctorCategory('Heart Pumb Ring'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getEducationHistory(String title) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: homeAppBar),
            ),
            const SizedBox(width: 10),
            getSubTitleText(title, homeAppBar),
          ],
        ),
      );
}
