import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/home_const.dart';

class DocInfoList extends StatelessWidget {
  const DocInfoList({super.key, required this.selectedIndex});
  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<String> aboutList = [
      'OverView',
      'Clinic & Fees',
      'Schedule',
      'Reveiws'
    ];
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, selected, __) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                aboutList.length,
                (i) => InkWell(
                  onTap: () => selectedIndex.value = i,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                      color: selected == i ? homeAppBar : Colors.transparent,
                    ),
                    child: Text(
                      aboutList[i],
                      style: TextStyle(
                        color: selected == i ? Colors.cyan : homeAppBar,
                        fontWeight:
                            selected == i ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
