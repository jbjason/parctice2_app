import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class HomeDoctorList extends StatelessWidget {
  const HomeDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) => Container(
          height: 125,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: bodyGradient,
            boxShadow: bodyShadow,
          ),
          child: Row(
            children: [
              Image.asset(doctors[i].img, width: 130, fit: BoxFit.contain),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        doctors[i].title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: homeAppBar, fontSize: 16),
                      ),
                      // subtitle
                      Text(
                        doctors[i].subtitle,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '★★★☆☆  25 Reviews',
                            style: TextStyle(color: Colors.cyan, fontSize: 9.5),
                          ),
                          Text(
                            '\$ ${doctors[i].fees}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.grey),
                      // location
                      Row(
                        children: [
                          const Icon(Icons.home_outlined, size: 11),
                          const SizedBox(width: 2),
                          Text(
                            doctors[i].location,
                            style: const TextStyle(
                                fontSize: 11, color: homeTextColor),
                          ),
                        ],
                      ),
                      // schedule
                      Row(
                        children: [
                          const Icon(Icons.schedule, size: 11),
                          const SizedBox(width: 2),
                          Text(
                            doctors[i].schedule,
                            style: const TextStyle(
                              fontSize: 11,
                              color: homeTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        childCount: doctors.length,
      ),
    );
  }
}
