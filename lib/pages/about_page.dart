import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const bgColor = Color(0xFFF7EDE9);
  static const cardPink = Color(0xFFF8BBD0);
  static const white = Colors.white;
  static const accent = Color(0xFFE57373);
  static const textMain = Color(0xFF2E2E2E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "Tentang Aplikasi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: accent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardPink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(Icons.quiz, size: 50, color: accent),
                  SizedBox(height: 10),
                  Text(
                    "Quiz Flutter & Dart",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textMain,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _sectionTitle("Deskripsi Aplikasi"),
            _sectionContent(
              "Aplikasi ini merupakan aplikasi quiz interaktif berbasis Flutter yang digunakan untuk menguji pemahaman pengguna terkait bahasa pemrograman Dart dan framework Flutter.",
            ),

            const SizedBox(height: 20),

            _sectionTitle("Fitur Utama"),
            _featureItem("Soal ditampilkan secara acak"),
            _featureItem("Variasi pertanyaan berbeda"),
            _featureItem("Timer setiap soal"),
            _featureItem("Progress bar"),
            _featureItem("Perhitungan skor otomatis"),
            _featureItem("UI modern"),

            const SizedBox(height: 20),

            _sectionTitle("Teknologi"),
            _featureItem("Flutter (UI Framework)"),
            _featureItem("Dart (Bahasa Pemrograman)"),
            _featureItem("JSON (Data soal)"),
            _featureItem("Stateful & Stateless Widget"),

            const SizedBox(height: 20),

            _sectionTitle("Tujuan Aplikasi"),
            _sectionContent(
              "Aplikasi ini dibuat untuk membantu pengguna memahami konsep dasar Flutter dan Dart melalui latihan soal interaktif yang menarik dan tidak monoton.",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textMain,
        ),
      ),
    );
  }

  Widget _sectionContent(String text) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 3)
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(color: textMain),
      ),
    );
  }

  Widget _featureItem(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: accent, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: textMain),
            ),
          ),
        ],
      ),
    );
  }
}