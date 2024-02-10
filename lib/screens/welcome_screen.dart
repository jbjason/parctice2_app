import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

const _duration1 = Duration(seconds: 2);

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  final List<String> _text = ["W", "E", "L", "C", "O", "M", "E"];
  late AnimationController _controller1;
  late Animation<double> _imgAnim1;
  late Animation<double> _imgAnimEnd1;
  late Animation<double> _textAnim1,
      _textAnim2,
      _textAnim3,
      _textAnim4,
      _textAnim5,
      _textAnim6,
      _textAnim7;
  late Animation<double> _textAnimEnd1,
      _textAnimEnd2,
      _textAnimEnd3,
      _textAnimEnd4,
      _textAnimEnd5,
      _textAnimEnd6,
      _textAnimEnd7;
  late Animation<double> _dotAnim1, _dotAnim2, _dotAnim3, _dotAnim4, _dotAnim5;
  late Animation<double> _dotAnimEnd1,
      _dotAnimEnd2,
      _dotAnimEnd3,
      _dotAnimEnd4,
      _dotAnimEnd5;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller1 = AnimationController(vsync: this, duration: _duration1);
    // _soowGoodImg = Tween(begin: 2.0, end: 1.0).animate(
    //     CurvedAnimation(parent: _controller1, curve: const Interval(.0, 0.3)));
    _imgAnim1 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.0, .5));
    _imgAnimEnd1 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.5, 1));

    ///
    /// welcome-text animation
    _textAnim1 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.0, .07));
    _textAnimEnd1 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.07, .14));
    _textAnim2 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.14, .21));
    _textAnimEnd2 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.21, .28));
    _textAnim3 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.28, .35));
    _textAnimEnd3 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.35, .42));
    _textAnim4 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.42, .49));
    _textAnimEnd4 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.49, .56));
    _textAnim5 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.56, .63));
    _textAnimEnd5 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.63, .70));
    _textAnim6 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.70, .77));
    _textAnimEnd6 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.77, .84));
    _textAnim7 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.84, .91));
    _textAnimEnd7 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.91, 1));

    ///
    /// dot animation
    _dotAnim1 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.0, .09));
    _dotAnimEnd1 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.1, .19));
    _dotAnim2 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.2, .29));
    _dotAnimEnd2 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.3, .39));
    _dotAnim3 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.4, .49));
    _dotAnimEnd3 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.5, .59));
    _dotAnim4 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.6, .69));
    _dotAnimEnd4 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.7, .79));
    _dotAnim5 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.8, .89));
    _dotAnimEnd5 =
        CurvedAnimation(parent: _controller1, curve: const Interval(.9, 1));
    _controller1.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textWidth = size.width / 10;
    return Scaffold(
      backgroundColor: MyColor.ashhLight,
      body: AnimatedBuilder(
        animation: _controller1,
        builder: (context, _) => Stack(
          children: [
            // soowGood-img animation
            Center(
              child: Transform.scale(
                scale: 1 + .5 * _imgAnim1.value - .5 * _imgAnimEnd1.value,
                child: Image.asset("assets/welcome01.png",
                    width: size.width * .65),
              ),
            ),

            ///
            /// welcome-text animation
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim1.value -
                  15 * _textAnimEnd1.value,
              left: textWidth * 1.5 + textWidth * 0,
              width: textWidth,
              child: Text(
                _text[0],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim2.value -
                  15 * _textAnimEnd2.value,
              left: textWidth * 1.5 + textWidth * 1,
              width: textWidth,
              child: Text(
                _text[1],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim3.value -
                  15 * _textAnimEnd3.value,
              left: textWidth * 1.5 + textWidth * 2,
              width: textWidth,
              child: Text(
                _text[2],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim4.value -
                  15 * _textAnimEnd4.value,
              left: textWidth * 1.5 + textWidth * 3,
              width: textWidth,
              child: Text(
                _text[3],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim5.value -
                  15 * _textAnimEnd5.value,
              left: textWidth * 1.5 + textWidth * 4,
              width: textWidth,
              child: Text(
                _text[4],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim6.value -
                  15 * _textAnimEnd6.value,
              left: textWidth * 1.5 + textWidth * 5,
              width: textWidth,
              child: Text(
                _text[5],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: size.height * .2 +
                  15 * _textAnim7.value -
                  15 * _textAnimEnd7.value,
              left: textWidth * 1.5 + textWidth * 6,
              width: textWidth,
              child: Text(
                _text[6],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            ///
            /// dot animation
            Positioned(
              bottom: 20 + 30 * _dotAnim1.value - 30 * _dotAnimEnd1.value,
              left: size.width * .36,
              child: const Text("⦿"),
            ),
            Positioned(
              bottom: 20 + 30 * _dotAnim2.value - 30 * _dotAnimEnd2.value,
              left: size.width * .36 + 22 * 1,
              child: const Text("⦿"),
            ),
            Positioned(
              bottom: 20 + 30 * _dotAnim3.value - 30 * _dotAnimEnd3.value,
              left: size.width * .36 + 22 * 2,
              child: const Text("⦿"),
            ),
            Positioned(
              bottom: 20 + 30 * _dotAnim4.value - 30 * _dotAnimEnd4.value,
              left: size.width * .36 + 22 * 3,
              child: const Text("⦿"),
            ),
            Positioned(
              bottom: 20 + 30 * _dotAnim5.value - 30 * _dotAnimEnd5.value,
              left: size.width * .36 + 22 * 4,
              child: const Text("⦿"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }
}

class MyColor {
  static const categoryColor = [
    Color(0xFFFF3D00),
    Color(0xFF69F0AE),
    Color(0xFF673AB7),
  ];

  static const ashhLight = Color(0xFFECF6FF);
  static const bluePrimary = Color(0xFF01204E);
  static const blueSecondary = Color(0xFF0E4D7B);
  static const skyPrimary = Color(0xFF30BCED);
  static const skySecondary = Color(0xFFBDDDFC);
  static const statusColor = Color(0xFFFEF8C0);
  static const statusText = Color(0xFF795548);
  static const dividerColor = Color(0x42000000);
  static const activeStatusColor = Color(0xFF00FF00);

  static const textColor = Color(0xFF2D2C2D);
  static const textSecondary = Color(0xFFF9F9F9);
  static const textThird = Colors.black38;

  static const themeTealBlue = Color(0xFF01204E);
  static const themeSkyBlue = Color(0xFF30BCED);
  static const blackPurple = Color(0xFF2D2C2D);
  static const tealBlueLight = Color(0xFF526D94);
  static const tealBlueDark = Color(0xFF0E4D7B);
  static const tealBlueMedium = Color(0xFF527EA8);

  static const skyBlueLight = Color(0xFFBDDDFC);
  static const offWhite = Color(0xFFF9F9F9);
  static const hintColor = Color(0x8001204F);

  static const activeOtp = Color(0xFFFFFFFF);
  static const selectedOtp = Color(0xFFBDDDFC);
  static const inactiveOtp = Color(0x80939597); //#929292

  static const lightPink = Color(0xffffccd8); //#929292
  static const darkPink = Color(0xfff8a0b5); //#929292

  static const black05 = Color(0x0d0d0d0d); //#929292

  static const teal = Color(0xE6010712); //
  static const teal40 = Color(0xCC010712); //

  static const searchColor = Color(0x8001204F);
  static const searchBgColor = Color(0x1F767680);

  static const clinicBgColor = Color(0x1A2FBBED);

  static const black06 = Color(0x0f9c9999); //#929292

  static const lightGreenBlue = Color(0xFFBBEFDD);
  static const teal50 = Color(0x800D4D7A);

  static const redBrown = Color(0xF8A10517);

  static const redBrownLight = Color(0xB3A10517);

  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE1E4EA),
    100: Color(0xFFB3BCCA),
    200: Color(0xFF8090A7),
    300: Color(0xFF4D6383),
    400: Color(0xFF274169),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF011C47),
    700: Color(0xFF01183D),
    800: Color(0xFF011330),
    900: Color(0xFF000B30),
  });
  static const int _primaryPrimaryValue = 0xFF01204E;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFF607CFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF002BF9),
    700: Color(0xFF0027E0),
  });
  static const int _primaryAccentValue = 0xFF2D52FF;
}
