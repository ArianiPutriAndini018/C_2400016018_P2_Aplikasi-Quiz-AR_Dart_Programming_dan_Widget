import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  static const bgColor = Color(0xFFF7EDE9);
  static const cardInfo = Color(0xFFF8BBD0);
  static const white = Colors.white;
  static const accent = Color(0xFFE57373);
  static const textMain = Color(0xFF2E2E2E);
  static const brown = Color(0xFF8B4A4A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        title: const Text("Quiz AR", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: accent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: accent),
              child: Text(
                "Quiz AR",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: accent),
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: accent),
              title: const Text("Tentang Aplikasi"),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 600),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 30 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz Flutter & Dart",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: brown,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Latihan interaktif untuk menguji pemahaman Flutter dan Dart.",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardInfo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Kerjakan soal secara acak, jawab dengan cepat, dan lihat hasil kemampuanmu secara langsung.",
                  style: TextStyle(
                    color: textMain,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Fitur Aplikasi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textMain,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: const [
                  _FeatureCard(title: "Soal Acak", icon: Icons.shuffle),
                  _FeatureCard(title: "Timer", icon: Icons.timer),
                  _FeatureCard(title: "Skor", icon: Icons.star),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4)
                  ],
                ),
                child: const Text(
                  "Aplikasi ini membantu memahami konsep Flutter dan Dart melalui quiz interaktif dengan tampilan modern.",
                  style: TextStyle(color: textMain),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  child: const Text(
                    "Mulai Quiz",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _FeatureCard({
    required this.title,
    required this.icon,
  });

  static const white = Colors.white;
  static const textMain = Color(0xFF2E2E2E);
  static const accent = Color(0xFFE57373);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 3)
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: accent),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: textMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}