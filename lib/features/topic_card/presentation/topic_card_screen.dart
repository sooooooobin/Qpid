import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../data/topic_questions.dart';

class TopicCardScreen extends HookWidget {
  final int level;

  const TopicCardScreen({super.key, this.level = 0});

  @override
  Widget build(BuildContext context) {
    final isFlipped = useState(false);
    final currentQuestion = useState<String?>(null);
    final passCount = useState(AppConstants.maxPassCount);
    final animController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final usedQuestions = useState<Set<String>>({});

    final questions = level == 0
        ? TopicQuestions.getAll()
        : TopicQuestions.getByLevel(level);

    String getRandomQuestion() {
      final available =
          questions.where((q) => !usedQuestions.value.contains(q)).toList();
      if (available.isEmpty) {
        usedQuestions.value = {};
        return questions[Random().nextInt(questions.length)];
      }
      final selected = available[Random().nextInt(available.length)];
      usedQuestions.value = {...usedQuestions.value, selected};
      return selected;
    }

    void drawCard() {
      if (isFlipped.value) {
        // 이미 뒤집혀 있으면 새 카드 뽑기
        isFlipped.value = false;
        animController.reverse().then((_) {
          currentQuestion.value = getRandomQuestion();
          isFlipped.value = true;
          animController.forward();
        });
      } else {
        // 처음 뽑기
        currentQuestion.value = getRandomQuestion();
        isFlipped.value = true;
        animController.forward();
      }
    }

    void passCard() {
      if (passCount.value > 0) {
        passCount.value--;
        drawCard();
      }
    }

    final levelColor = AppTheme.getLevelColor(level == 0 ? 2 : level);

    return Scaffold(
      backgroundColor: AppTheme.warmCream,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(_getLevelTitle(level)),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
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
                const Icon(Icons.skip_next,
                    size: 18, color: AppTheme.textLight),
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
      body: GestureDetector(
        onTap: () {
          if (!isFlipped.value) {
            drawCard();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: AnimatedBuilder(
              animation: animController,
              builder: (context, child) {
                final rotateValue = animController.value * pi;
                final showBack = animController.value > 0.5;

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(rotateValue),
                  child: Container(
                    width: double.infinity,
                    height: 420,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          levelColor,
                          levelColor.withOpacity(0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: levelColor.withOpacity(0.4),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(showBack ? pi : 0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: showBack && currentQuestion.value != null
                              ? Text(
                                  currentQuestion.value!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.touch_app,
                                      size: 72,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      '터치해서\n질문 뽑기',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(0.95),
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
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
      ),
      bottomNavigationBar: isFlipped.value
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: passCount.value > 0 ? passCard : null,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: passCount.value > 0
                                ? AppTheme.primaryPeach
                                : Colors.grey,
                          ),
                          foregroundColor: passCount.value > 0
                              ? AppTheme.primaryPeach
                              : Colors.grey,
                        ),
                        child: Text(
                          'PASS (${passCount.value})',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: drawCard,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          '다음 질문',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  String _getLevelTitle(int level) {
    if (level == 0) return '🎲 전체 토픽';
    final levelInfo = AppConstants.levels[level];
    if (levelInfo == null) return '토픽 카드';
    return '${levelInfo.emoji} ${levelInfo.title}';
  }
}
