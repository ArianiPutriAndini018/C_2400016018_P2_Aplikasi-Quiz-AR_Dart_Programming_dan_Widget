import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../services/question_service.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {

  static const bgColor = Color(0xFFF7EDE9);
  static const appBarColor = Color(0xFFE57373);
  static const progressColor = Color(0xFFF8BBD0);
  static const cardColor = Color(0xFFF8BBD0);
  static const optionDefault = Colors.white;
  static const optionSelected = Color(0xFFF8BBD0);
  static const buttonNext = Color(0xFFE57373);
  static const textColor = Color(0xFF2E2E2E);

  List<Question> questions = [];
  Question? currentQuestion;

  List<String> options = [];
  String questionText = "";

  String? selectedAnswer;
  bool showResult = false;
  String result = "";

  int score = 0;
  int currentIndex = 0;

  int timeLeft = 10;
  final int maxTime = 10;
  Timer? timer;

  final labels = ["A", "B", "C", "D"];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> loadQuestions() async {
    questions = await QuestionService.loadQuestions();
    questions.shuffle();
    loadQuestion();
  }

  void loadQuestion() {
    timer?.cancel();

    if (questions.isEmpty) return;

    final q = questions[currentIndex];
    q.questionVariants.shuffle();

    List<String> tempOptions = [
      q.correctAnswer,
      ...q.wrongAnswers
    ];
    tempOptions.shuffle();

    setState(() {
      currentQuestion = q;
      questionText = q.questionVariants.first;
      options = tempOptions;

      selectedAnswer = null;
      showResult = false;
      result = "";

      timeLeft = maxTime;
    });

    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() => timeLeft--);
      } else {
        t.cancel();

        setState(() {
          result = "Waktu habis";
        });

        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) nextQuestion();
        });
      }
    });
  }

  void selectAnswer(String selected) {
    if (showResult) return;

    setState(() {
      selectedAnswer = selected;
    });
  }

  void onNextPressed() {
    timer?.cancel();

    if (selectedAnswer != null && !showResult) {
      setState(() {
        showResult = true;

        if (selectedAnswer == currentQuestion!.correctAnswer) {
          result = "Jawaban benar";
          score++;
        } else {
          result = "Jawaban salah";
        }
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) nextQuestion();
      });
    } else {
      nextQuestion();
    }
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
      loadQuestion();
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {
          'score': score,
          'total': questions.length,
        },
      );
    }
  }

  double get progress =>
      (currentIndex + 1) / (questions.isEmpty ? 1 : questions.length);

  double get timerProgress => timeLeft / maxTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Quiz AR",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        centerTitle: true,
      ),

      body: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.white,
                    valueColor:
                        const AlwaysStoppedAnimation(progressColor),
                  ),

                  const SizedBox(height: 15),

                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: timerProgress,
                          minHeight: 13,
                          backgroundColor: Colors.white,
                          valueColor:
                              const AlwaysStoppedAnimation(appBarColor),
                        ),
                      ),

                      Positioned(
                        right: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            "$timeLeft detik",
                            style: const TextStyle(
                              fontSize: 12,
                              color: textColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Soal ${currentIndex + 1}/${questions.length}",
                    style: const TextStyle(color: textColor),
                  ),

                  const SizedBox(height: 20),

               
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      questionText,
                      style: const TextStyle(
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ...options.asMap().entries.map((entry) {
                    int index = entry.key;
                    String opt = entry.value;

                    bool isSelected = selectedAnswer == opt;
                    bool isCorrect =
                        opt == currentQuestion!.correctAnswer;

                    Color bg = optionDefault;

                    if (!showResult) {
                      if (isSelected) bg = optionSelected;
                    } else {
                      if (isCorrect) {
                        bg = Colors.green.shade200;
                      } else if (isSelected) {
                        bg = Colors.red.shade200;
                      }
                    }

                    return GestureDetector(
                      onTap: () => selectAnswer(opt),
                      child: AnimatedScale(
                        scale: isSelected ? 1.03 : 1,
                        duration: const Duration(milliseconds: 150),
                        child: Container(
                          margin:
                              const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [

                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: appBarColor,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  labels[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  opt,
                                  style: const TextStyle(
                                      color: textColor),
                                ),
                              ),

                              if (!showResult && isSelected)
                                const Icon(Icons.check_circle,
                                    color: textColor),

                              if (showResult)
                                Icon(
                                  isCorrect
                                      ? Icons.check_circle
                                      : (isSelected
                                          ? Icons.cancel
                                          : null),
                                  color: textColor,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  if (showResult)
                    Text(
                      result,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonNext,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: onNextPressed,
                    child: const Text("Next"),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Score: $score",
                    style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}