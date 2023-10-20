import 'package:flutter/material.dart';
import 'package:parctice2_app/constants/constants.dart';
import 'package:parctice2_app/constants/my_dimens.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class TestScreen extends StatelessWidget {
  static const routeName = "/test-screen";
  const TestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.ashhLight,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 250),
            Expanded(
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemCount: 6,
                itemBuilder: (context, i) => ProductItem(index: i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cWidth = 120.0;
    const center2 = Offset(cWidth / 2.4, cWidth / 3);
    canvas.drawCircle(center2, 55, Paint()..color = Colors.brown);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TestImgClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    const cWidth = 120.0;
    const center2 = Offset(cWidth / 2.4, cWidth / 3);
    final rect =
        Rect.fromCenter(center: center2, width: cWidth, height: cWidth);
    path.addArc(rect, vector.radians(0), vector.radians(360));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
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

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(boxShadow: MyDimens.bodyShadow),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _getImage(index),
          Positioned.fill(
            child: ClipPath(
              clipper: TestBodyClipper(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: MyDimens.bodyGradient,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: MyDimens.bodyShadow),
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
                            MyDimens().getDoctorCategory("General Physician"),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _getImage(int i) => Positioned(
        left: -5,
        top: -15,
        width: 110,
        height: 110,
        //  height: 130,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: MyDimens.bodyShadow,
            border: Border.all(color: Colors.black),
            image: DecorationImage(
              image: AssetImage("assets/doctor/doc${(i % 3) + 1}.png"),
              fit: BoxFit.cover,
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
