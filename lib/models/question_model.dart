class Question {
  final List<String> questionVariants;
  final String correctAnswer;
  final List<String> wrongAnswers;

  Question({
    required this.questionVariants,
    required this.correctAnswer,
    required this.wrongAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionVariants: List<String>.from(json['questionVariants']),
      correctAnswer: json['correctAnswer'],
      wrongAnswers: List<String>.from(json['wrongAnswers']),
    );
  }
}
