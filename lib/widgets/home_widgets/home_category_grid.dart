import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class HomeCategoryGrid extends StatelessWidget {
  const HomeCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisExtent: 80),
      delegate: SliverChildBuilderDelegate((context, i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: bodyGradient,
                ),
                child: Image.asset(categories[i].img, fit: BoxFit.contain),
              ),
              const SizedBox(height: 4),
              Text(
                categories[i].title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: homeAppBar, fontSize: 11),
              ),
            ],
          ),
        );
      }, childCount: categories.length),
    );
  }
}
