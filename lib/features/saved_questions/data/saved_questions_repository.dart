import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../question/data/question_data.dart';

class SavedQuestionsRepository {
  static const String _key = 'saved_questions';

  static Future<void> saveQuestion(Question question) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = await getSavedQuestions();
    
    // 중복 체크
    if (saved.any((q) => q.text == question.text)) {
      return;
    }

    saved.add(question);
    final jsonList = saved.map((q) => {
      'text': q.text,
      'level': q.level,
      'type': q.type.toString(),
      'guide': q.guide,
    }).toList();

    await prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<List<Question>> getSavedQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.map((json) {
        QuestionType type;
        switch (json['type']) {
          case 'QuestionType.iceBreaking':
            type = QuestionType.iceBreaking;
            break;
          case 'QuestionType.deepTalk':
            type = QuestionType.deepTalk;
            break;
          case 'QuestionType.balance':
            type = QuestionType.balance;
            break;
          case 'QuestionType.whatIf':
            type = QuestionType.whatIf;
            break;
          default:
            type = QuestionType.iceBreaking;
        }

        return Question(
          text: json['text'] as String,
          level: json['level'] as int,
          type: type,
          guide: json['guide'] as String?,
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> deleteQuestion(String questionText) async {
    final saved = await getSavedQuestions();
    saved.removeWhere((q) => q.text == questionText);

    final jsonList = saved.map((q) => {
      'text': q.text,
      'level': q.level,
      'type': q.type.toString(),
      'guide': q.guide,
    }).toList();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

