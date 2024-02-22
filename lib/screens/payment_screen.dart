import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                painter: MsgBubblePainter(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                      "jjjjjjjjjjjjjjjjjj-------------------------llllllllllllll" *
                          10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MsgBubbleClipper extends CustomClipper {
  @override
  getClip(Size size) {
    final w = size.width, h = size.height;
    final path = Path();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class MsgBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final paint = Paint()..color = Colors.red;
    final path = Path();
    path.lineTo(w, 0);
    path.lineTo(w, h + 20);
    path.lineTo(w - 10, h);
    path.lineTo(0, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
