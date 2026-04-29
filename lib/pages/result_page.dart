import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  static const bgColor = Color(0xFFF7EDE9);
  static const cardColor = Color(0xFFF8BBD0);
  static const accent = Color(0xFFE57373);
  static const textMain = Color(0xFF2E2E2E);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final int score = args['score'];
    final int total = args['total'];

    double percentage = (score / total) * 100;

    String label;
    if (percentage >= 80) {
      label = "Mantap!";
    } else if (percentage >= 50) {
      label = "Lumayan";
    } else {
      label = "Coba Lagi";
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 700),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Icon(
                    Icons.emoji_events,
                    size: 80,
                    color: accent,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Quiz Selesai",
                    style: TextStyle(
                      color: textMain,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      color: textMain,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "$score / $total",
                    style: const TextStyle(
                      color: accent,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${percentage.toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontSize: 16,
                      color: textMain,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: score / total,
                      minHeight: 10,
                      backgroundColor: Colors.white,
                      valueColor:
                          const AlwaysStoppedAnimation(accent),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Main Lagi",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}