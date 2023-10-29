import 'package:flutter/material.dart';
import 'package:parctice2_app/constants/constants.dart';

class MyDimens {
  static const bodyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white, Colors.white, Color(0xB3FFFFFF), Color(0x62FFFFFF)],
  );

  Gradient getHomeGradient(Color color) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          color.withOpacity(.9),
          color.withOpacity(.6),
          color.withOpacity(.4)
        ],
      );

  static const bodyShadow = [
    BoxShadow(
      color: Color.fromARGB(255, 144, 176, 208),
      blurRadius: 40,
      offset: Offset(5, 2),
    ),
    BoxShadow(
      color: Colors.white,
      blurRadius: 40,
      offset: Offset(-5, -2),
    ),
  ];

  Widget getTitleText(String title, Color color) => Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      );

  Widget getSubTitleText(String title, Color color) => Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 9.5, color: color),
      );

  Widget getTitleSeeAllText(String title, Function onTap) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: MyColor.blueSecondary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () => onTap,
            child: const Text(
              'See More',
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
          ),
        ],
      );

  Widget getDoctorCategory(String title) => Container(
        padding: const EdgeInsets.only(left: 7, top: 3, bottom: 3, right: 14),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(
          color: MyColor.blueSecondary,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(4),
            right: Radius.circular(14),
          ),
        ),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 9, color: Colors.white),
        ),
      );

  Container getButtonStyle({required Widget child}) => Container(
        height: kBottomNavigationBarHeight,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: MyColor.bluePrimary,
          boxShadow: bodyShadow,
        ),
        child: child,
      );

  Future<bool> showExitPopup(BuildContext context) async => await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App',
              style: TextStyle(
                  fontFamily: "poppins_regular", fontWeight: FontWeight.bold)),
          content: const Text('Do you want to exit SoowGood?',
              style: TextStyle(
                  fontFamily: "poppins_regular",
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "poppins_regular",
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "poppins_regular",
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      );
}
