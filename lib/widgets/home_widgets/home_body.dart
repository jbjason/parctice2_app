import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';
import 'package:parctice2_app/widgets/home_widgets/home_search_field.dart';
import 'package:parctice2_app/widgets/home_widgets/homeb_offer_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // search textField
            const HomeSearchField(),
            const SizedBox(height: 20),
            // offer box
            const HomeBOfferContainer(),
            const SizedBox(height: 20),
            // categories text
            getTitleSeeAllText('OUR SERVICE', () {}),
          ],
        ),
      ),
    );
  }
}
