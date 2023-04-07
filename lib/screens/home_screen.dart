import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // image: const DecorationImage(image: AssetImage('assets/3.jpg')),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[800]!,
              Colors.grey[850]!,
              Colors.grey[900]!,
            ],
          ),
        ),
        child: CustomPaint(
          foregroundPainter: HomeTopPainter(),
          child: Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          ),
        ),
      ),
    );
  }

  Widget _widget() => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CustomPaint(
          painter: MyPainter(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                top: -15,
                left: -15,
                height: 40,
                width: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightGreen,
                        blurRadius: 60,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: 3,
                left: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(.2),
                              Colors.white.withOpacity(.05),
                              Colors.transparent
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class HomeTopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final path = Path();
    final paint1 = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    path.lineTo(0, 30);
    path.lineTo(w / 2, 30);
    path.lineTo(w, 30);
    path.close();
    canvas.drawPath(path, paint1);

    const gradient1 = LinearGradient(
      colors: [
        Color(0xFFccff33),
        Color.fromARGB(255, 226, 247, 164),
        Colors.transparent,
      ],
    );

    final center = Offset(w / 2, 20);
    final rect2 = Rect.fromCenter(center: center, height: 20, width: 50);
    final paint2 = Paint()
      ..color = Colors.transparent; //..shader = gradient1.createShader(rect2);
    final path2 = Path();
    path2.moveTo(w / 2, 30);
    path2.addRect(rect2);
    path2.close();
    canvas.drawShadow(path2, const Color(0xFFccff33), 10.0, false);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final center = Offset(w / 2, h / 2);
    final rect1 = Rect.fromCenter(center: center, width: w, height: h);
    const gradient1 = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          0,
          .2,
          .4,
          1
        ],
        colors: [
          Color(0xFFccff33),
          Color(0xFFccff33),
          Colors.transparent,
          Colors.transparent,
        ]);
    final paint = Paint()..shader = gradient1.createShader(rect1);

    final path = Path();
    path.lineTo(w, 0);
    path.lineTo(w, 3);
    path.lineTo(40, 3);
    path.quadraticBezierTo(0, 3, 5, 20);
    path.lineTo(3, h);
    path.lineTo(0, h);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}