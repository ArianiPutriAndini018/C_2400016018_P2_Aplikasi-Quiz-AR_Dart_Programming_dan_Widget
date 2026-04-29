import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class QuestionService {
  static Future<List<Question>> loadQuestions() async {
    final String response =
        await rootBundle.loadString('assets/questions.json');

    final List data = json.decode(response);

    return data
        .map<Question>((q) => Question.fromJson(q))
        .toList();
  }
}