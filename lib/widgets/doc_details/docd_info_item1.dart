import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class DocDInfoItem1 extends StatelessWidget {
  const DocDInfoItem1({super.key});

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
        Wrap(
          children: [
            getDoctorCategory('Heart Sergery'),
            const SizedBox(width: 10),
            getDoctorCategory('Heart Mobility'),
            const SizedBox(width: 10),
            getDoctorCategory('Heart Pumb Ring'),
            const SizedBox(width: 10),
            getDoctorCategory('Heart Pumb Ring'),
            const SizedBox(width: 10),
            getDoctorCategory('Heart Pumb Ring'),
          ],
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
