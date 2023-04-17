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
                      _subtitle(doctors[i].subtitle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '★★★☆☆  25 Reviews',
                            style: TextStyle(color: Colors.cyan, fontSize: 9),
                          ),
                          Text(
                            '\$ ${doctors[i].fees}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(color: Color(0xFFBDBDBD)),
                      // location
                      _locationScheduleText(
                          Icons.location_on_outlined, doctors[i].location),
                      // schedule
                      _locationScheduleText(
                          Icons.schedule, doctors[i].schedule),
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

  Widget _locationScheduleText(IconData icon, String title) => Row(
        children: [
          Icon(icon, size: 11),
          const SizedBox(width: 2),
          Text(
            title,
            style: const TextStyle(fontSize: 11, color: homeTextColor),
          ),
        ],
      );

  Widget _subtitle(String title) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        decoration: const BoxDecoration(
          color: homeAppBar,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(4),
            right: Radius.circular(14),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 10, color: Colors.white),
        ),
      );
}
