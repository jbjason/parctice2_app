import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:parctice2_app/constants/constants.dart';
import 'package:parctice2_app/constants/my_dimens.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;

class TestScreen extends StatelessWidget {
  static const routeName = "/test-screen";
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/3.jpg'), fit: BoxFit.cover),
          ),
          child: Column(children: [
            const FrostedGlassBox(
              width: double.infinity,
              height: 100,
              child: Center(child: Text('Hiii There!!')),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                clipBehavior: Clip.none,
                itemCount: 6,
                itemBuilder: (context, i) => ProductItem(index: i),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class FrostedGlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGlassBox(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: SizedBox(
                  width: width, height: height, child: const Text(" ")),
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 30,
                        offset: const Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1),
                      ],
                      stops: const [
                        0.0,
                        1.0,
                      ])),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.only(bottom: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _getImage(index),
          Positioned.fill(
            child: ClipPath(
              clipper: TestBodyClipper(),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 7.0,
                      sigmaY: 7.0,
                    ),
                    child: const SizedBox(
                        width: double.infinity, height: 135, child: Text(" ")),
                  ),
                  _getGlassEffect(
                    child: Row(
                      children: [
                        const SizedBox(width: 130),
                        // title, subtitle, review, fees & location
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Text(
                                  "Abdullah Al Jubayer",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                // speciality
                                // speciality list starts from 0 but in server starts form 1, so we are decreasing
                                MyDimens()
                                    .getDoctorCategory("General Physician"),
                                const Divider(thickness: .5),
                                // reviews & fees
                                _reviewsAndFees(3, 112, 2500),
                                const Spacer(),
                                // location
                                _locationScheduleText(
                                  Icons.location_on_outlined,
                                  "Mirpur Dhaka- 1216",
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getGlassEffect({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 30,
            offset: const Offset(2, 2),
          )
        ],
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.1),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }

  Widget _getImage(int i) => Positioned(
        left: -10,
        top: -20,
        width: 110,
        height: 110,
        child: CustomPaint(
          painter: TestImgpainter(),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: AssetImage("assets/doctor/doc${(i % 3) + 1}.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget _locationScheduleText(IconData icon, String title) => Row(
        children: [
          Icon(icon, size: 11),
          const SizedBox(width: 2),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ],
      );

  Widget _reviewsAndFees(int rating, int reviews, double fees) {
    final totalRating = '★' * rating + "☆" * (5 - rating);
    final review = reviews == 0 ? "No" : reviews;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // reviews
        RichText(
          text: TextSpan(
            text: totalRating,
            style: const TextStyle(color: Colors.cyan, fontSize: 10),
            children: [
              TextSpan(
                text: '   $review Reviews',
                style: const TextStyle(color: Colors.cyan, fontSize: 8),
              ),
            ],
          ),
        ),
        // fees
        Text('৳ $fees', style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class TestImgpainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final center = Offset(w / 2, h / 2);
    final paint = _getPaint(MyColor.bluePrimary, 6);
    final path = Path();
    final rect = Rect.fromCenter(center: center, width: w, height: h);
    path.addArc(rect, vector.radians(0), vector.radians(270));
    canvas.drawPath(path, paint);

    ///
    ///
    final paint2 = _getPaint(MyColor.ashhLight, 1.5);
    final path2 = Path();
    final rect2 = Rect.fromCenter(center: center, width: w, height: h);
    path2.addArc(rect2, vector.radians(0), vector.radians(270));
    canvas.drawPath(path2, paint2);

    ///
    /// radian 270 to 360 is available for drawing stars
    /// will draw 3 stars, so adding 270+ (360 - 270.0)/ 3
    final paint3 = Paint()..color = MyColor.skyPrimary;
    const star = (360 - 270.0) / 4;
    final path3 = Path();

    for (int i = 1; i <= 3; i++) {
      final sideDiff = 6 + ((i - 1) * 2), closeDiff = i * 1;
      final x3 = center.dx + w / 2 * math.cos(vector.radians(360 - (star * i)));
      final y3 = center.dy + w / 2 * math.sin(vector.radians(360 - (star * i)));
      path3.moveTo(x3 - sideDiff, y3);
      path3.lineTo(x3 - closeDiff, y3 - closeDiff);
      path3.lineTo(x3, y3 - sideDiff);

      path3.lineTo(x3 + closeDiff, y3 - closeDiff);
      path3.lineTo(x3 + sideDiff, y3);
      path3.lineTo(x3 + closeDiff, y3 + closeDiff);
      path3.lineTo(x3, y3 + sideDiff);
      path3.lineTo(x3 - closeDiff, y3 + closeDiff);
      path3.close();
      canvas.drawPath(path3, paint3);
    }
  }

  Paint _getPaint(Color color, double width) => Paint()
    ..strokeWidth = width
    ..color = color
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TestBodyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final h = size.height, w = size.width;
    final path = Path();
    path.moveTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.lineTo(0, h * .8);
    path.cubicTo(0, h * .6, w * .1, h * .83, w * .1, h * .8);
    path.cubicTo(w * .13, h * .83, w * .3, h * .9, w * .3, h * .2);
    path.quadraticBezierTo(w * .3, 0, w * .4, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
