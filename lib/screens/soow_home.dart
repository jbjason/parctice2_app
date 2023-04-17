import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';
import 'package:parctice2_app/widgets/home_widgets/home_appbar.dart';
import 'package:parctice2_app/widgets/home_widgets/home_body.dart';
import 'package:parctice2_app/widgets/home_widgets/home_category_grid.dart';
import 'package:parctice2_app/widgets/home_widgets/home_doctor_list.dart';

class SooHome extends StatelessWidget {
  static const routeName = '/soo-home';
  const SooHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clock1,
      body: CustomScrollView(
        slivers: [
          const HomeAppbar(),
          const HomeBody(),
          const HomeCategoryGrid(),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: titleSeeAllText('TOP DOCTOR', () {})),
          ),
          const HomeDoctorList(),
        ],
      ),
    );
  }
}
