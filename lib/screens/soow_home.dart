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
    return const Scaffold(
      backgroundColor: ashhLight,
      body: CustomScrollView(
        slivers: [
          HomeAppbar(),
          HomeBody(),
          HomeCategoryGrid(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Top Doctor',
                style: TextStyle(
                    color: homeTextColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          HomeDoctorList(),
        ],
      ),
    );
  }
}
