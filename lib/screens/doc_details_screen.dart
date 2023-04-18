import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/doc_details/docd_info_item1.dart';
import 'package:parctice2_app/widgets/doc_details/docd_info_category.dart';
import 'package:parctice2_app/widgets/doc_details/docd_appbar.dart';
import 'package:parctice2_app/widgets/doc_details/docd_info_item4.dart';
import 'package:parctice2_app/widgets/doc_details/docd_top_container.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class DocDetailsScreen extends StatelessWidget {
  static const routeName = '/soow-description';
  const DocDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = doctors[0];
    final selectedIndex = ValueNotifier<int>(0);
    final infoItems = [
      const DocDInfoItem1(),
      const Text('Clinic & Fees'),
      const Text('Schedule'),
      DocDInfoItem4(doctor: doctor),
    ];

    return Scaffold(
      backgroundColor: ashhLight,
      body: CustomScrollView(
        slivers: [
          // appBar
          const DocDAppBar(),
          // body
          DocDTopContainer(doctor: doctor),
          // doc-infoList-category
          SliverToBoxAdapter(
              child: DocDInfoCategory(selectedIndex: selectedIndex)),
          // doc-infoList-body
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, index, _) => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25.0),
                child: infoItems[index],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: getHomeGradient(const Color(0xFF80DDEA)),
          boxShadow: bodyShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Fee:  \$${doctor.fees}'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white54,
              ),
              child: const Text(
                'Appointment',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
