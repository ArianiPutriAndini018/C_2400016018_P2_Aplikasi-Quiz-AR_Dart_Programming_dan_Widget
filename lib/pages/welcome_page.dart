import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const bgTop = Color(0xFFF7EDE9);
  static const bgBottom = Color(0xFFE57373);
  static const primary = Color(0xFFF8BBD0);
  static const textMain = Color(0xFF2E2E2E);
  static const textSecondary = Color(0xFF6B6B6B);
  static const welcome = Color(0xFF8B4A4A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(color: bgTop),

          CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: WavePainter(),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Spacer(),

                  SizedBox(
                    height: 360,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/welcome.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "𝓦𝓮𝓵𝓬𝓸𝓶𝓮",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Test your knowledge with interactive quiz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(fontSize: 16, color: welcome),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = WelcomePage.bgBottom
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height * 0.6);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.6,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.6,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}