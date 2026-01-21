import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../data/question_data.dart';
import '../../saved_questions/data/saved_questions_repository.dart';

class QuestionCardScreen extends HookWidget {
  final int level;

  const QuestionCardScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    final questions = useState<List<Question>>(
      QuestionData.getByLevel(level),
    );
    final selectedCardIndex = useState<int?>(null);
    final currentQuestion = useState<Question?>(null);
    final usedQuestionIds = useState<Set<String>>({});
    final passCount = useState(AppConstants.maxPassCount);
    final cardControllers = List.generate(
      3,
      (index) => useAnimationController(
        duration: const Duration(milliseconds: 600),
      ),
    );
    final cardFlipped = useState<List<bool>>([false, false, false]);

    String getRandomQuestion() {
      final available = questions.value
          .where((q) => !usedQuestionIds.value.contains(q.text))
          .toList();
      if (available.isEmpty) {
        usedQuestionIds.value = {};
        return questions.value[Random().nextInt(questions.value.length)].text;
      }
      final selected = available[Random().nextInt(available.length)];
      usedQuestionIds.value = {...usedQuestionIds.value, selected.text};
      return selected.text;
    }

    void selectCard(int index) {
      if (selectedCardIndex.value != null) return; // 이미 선택됨

      HapticFeedback.selectionClick();
      selectedCardIndex.value = index;
      cardFlipped.value[index] = true;
      cardControllers[index].forward();

      // 랜덤 질문 선택
      final questionText = getRandomQuestion();
      final question = questions.value.firstWhere((q) => q.text == questionText);
      currentQuestion.value = question;
    }

    void nextQuestion() {
      if (selectedCardIndex.value == null) return;

      // 카드 리셋
      final prevIndex = selectedCardIndex.value!;
      cardControllers[prevIndex].reverse().then((_) {
        cardFlipped.value[prevIndex] = false;
        selectedCardIndex.value = null;
        currentQuestion.value = null;
      });
    }

    void passQuestion() {
      if (passCount.value > 0 && selectedCardIndex.value != null) {
        passCount.value--;
        nextQuestion();
      }
    }

    void saveQuestion() {
      if (currentQuestion.value != null) {
        SavedQuestionsRepository.saveQuestion(currentQuestion.value!);
        HapticFeedback.mediumImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('질문이 저장되었습니다'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }

    final levelInfo = AppConstants.levels[level]!;
    final levelColor = AppTheme.getLevelColor(level);

    return Scaffold(
      backgroundColor: AppTheme.creamBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('${levelInfo.emoji} ${levelInfo.title}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (currentQuestion.value != null)
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: saveQuestion,
              tooltip: '질문 저장',
            ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.softCoral,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.skip_next, size: 18, color: AppTheme.textLight),
                const SizedBox(width: 4),
                Text(
                  'PASS ${passCount.value}/${AppConstants.maxPassCount}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 안내 문구
            if (selectedCardIndex.value == null)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  '하나 골라보실래요?',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.textDark,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),

            // 카드 3장
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (index) {
                    final isSelected = selectedCardIndex.value == index;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => selectCard(index),
                          child: AnimatedBuilder(
                            animation: cardControllers[index],
                            builder: (context, child) {
                              final rotateValue = cardControllers[index].value * pi;
                              final showBack = cardControllers[index].value > 0.5;

                              return AnimatedScale(
                                scale: isSelected ? 1.08 : 1.0,
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOutBack,
                                child: Transform.translate(
                                  offset: Offset(0, isSelected ? -8 : 0),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateY(rotateValue),
                                    child: Container(
                                      height: 280,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: showBack
                                              ? [
                                                  levelColor,
                                                  levelColor.withOpacity(0.8),
                                                ]
                                              : [
                                                  Colors.white,
                                                  AppTheme.softCoral.withOpacity(0.3),
                                                ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: isSelected
                                                ? levelColor.withOpacity(0.45)
                                                : Colors.black.withOpacity(0.1),
                                            blurRadius: isSelected ? 24 : 10,
                                            offset: Offset(0, isSelected ? 10 : 4),
                                          ),
                                        ],
                                      ),
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()
                                          ..rotateY(showBack ? pi : 0),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: showBack && isSelected
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.open_in_full,
                                                        size: 40,
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                      ),
                                                      const SizedBox(height: 12),
                                                      Text(
                                                        '질문 확인',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white
                                                              .withOpacity(0.95),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.help_outline,
                                                        size: 48,
                                                        color: AppTheme.textLight
                                                            .withOpacity(0.5),
                                                      ),
                                                      const SizedBox(height: 12),
                                                      Text(
                                                        '?',
                                                        style: TextStyle(
                                                          fontSize: 32,
                                                          fontWeight: FontWeight.bold,
                                                          color: AppTheme.textLight
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            if (selectedCardIndex.value != null &&
                currentQuestion.value != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutBack,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          levelColor,
                          levelColor.withOpacity(0.85),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: levelColor.withOpacity(0.35),
                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentQuestion.value!.text,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                        if (currentQuestion.value?.guide != null) ...[
                          const SizedBox(height: 10),
                          Text(
                            currentQuestion.value!.guide!,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.85),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

            // 하단 버튼
            if (selectedCardIndex.value != null)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: passCount.value > 0 ? passQuestion : null,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: passCount.value > 0
                                ? AppTheme.primaryCoral
                                : Colors.grey,
                          ),
                          foregroundColor: passCount.value > 0
                              ? AppTheme.primaryCoral
                              : Colors.grey,
                        ),
                        child: Text(
                          '이 질문 패스하기 (${passCount.value})',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: nextQuestion,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          '다음 질문',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

