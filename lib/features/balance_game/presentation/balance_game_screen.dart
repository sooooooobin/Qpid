import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../core/theme/app_theme.dart';
import '../data/balance_questions.dart';

class BalanceGameScreen extends HookWidget {
  const BalanceGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questions = useState<List<BalanceQuestion>>(
      BalanceQuestions.getMixed(),
    );
    final currentIndex = useState(0);
    final matchCount = useState(0);
    final showResult = useState(false);
    final player1Choice = useState<int?>(null);
    final player2Choice = useState<int?>(null);
    final isMatched = useState<bool?>(null);

    void resetGame() {
      final newQuestions = BalanceQuestions.getMixed();
      questions.value = newQuestions;
      currentIndex.value = 0;
      matchCount.value = 0;
      showResult.value = false;
      player1Choice.value = null;
      player2Choice.value = null;
      isMatched.value = null;
    }

    void selectChoice(int choice) {
      if (player1Choice.value == null) {
        player1Choice.value = choice;
      } else if (player2Choice.value == null) {
        player2Choice.value = choice;

        // 매칭 확인
        final matched = player1Choice.value == player2Choice.value;
        isMatched.value = matched;
        if (matched) {
          matchCount.value++;
        }

        // 다음 질문으로
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (currentIndex.value < questions.value.length - 1) {
            currentIndex.value++;
            player1Choice.value = null;
            player2Choice.value = null;
            isMatched.value = null;
          } else {
            showResult.value = true;
          }
        });
      }
    }

    if (showResult.value) {
      final matchPercent =
          (matchCount.value / questions.value.length * 100).round();
      return _ResultScreen(
        matchPercent: matchPercent,
        onRestart: resetGame,
      );
    }

    final currentQ = questions.value[currentIndex.value];

    return Scaffold(
      backgroundColor: AppTheme.warmCream,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('${currentIndex.value + 1} / ${questions.value.length}'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 진행 바
          LinearProgressIndicator(
            value: (currentIndex.value + 1) / questions.value.length,
            backgroundColor: AppTheme.softCoral,
            valueColor: const AlwaysStoppedAnimation(AppTheme.primaryPeach),
            minHeight: 6,
          ),

          const Spacer(),

          // 카테고리 표시
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryPeach.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              currentQ.category,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.accentRose,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // VS 선택지
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: _ChoiceButton(
                    text: currentQ.optionA,
                    isPlayer1Selected: player1Choice.value == 0,
                    isPlayer2Selected: player2Choice.value == 0,
                    isMatched: isMatched.value == true &&
                        player1Choice.value == 0 &&
                        player2Choice.value == 0,
                    onTap: () => selectChoice(0),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textLight,
                    ),
                  ),
                ),
                Expanded(
                  child: _ChoiceButton(
                    text: currentQ.optionB,
                    isPlayer1Selected: player1Choice.value == 1,
                    isPlayer2Selected: player2Choice.value == 1,
                    isMatched: isMatched.value == true &&
                        player1Choice.value == 1 &&
                        player2Choice.value == 1,
                    onTap: () => selectChoice(1),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // 안내 문구
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isMatched.value != null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isMatched.value!
                          ? Colors.green.withOpacity(0.2)
                          : Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isMatched.value! ? '💕 취향이 같아요!' : '😊 서로 다른 매력이 있네요!',
                      key: ValueKey(isMatched.value),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isMatched.value!
                            ? Colors.green[700]
                            : Colors.orange[700],
                      ),
                    ),
                  )
                : Text(
                    player1Choice.value == null
                        ? '🙋 첫 번째 분이 선택해주세요!'
                        : '🙋‍♀️ 두 번째 분 차례예요!',
                    key: ValueKey(player1Choice.value == null),
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppTheme.textLight,
                    ),
                  ),
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class _ChoiceButton extends StatelessWidget {
  final String text;
  final bool isPlayer1Selected;
  final bool isPlayer2Selected;
  final bool isMatched;
  final VoidCallback onTap;

  const _ChoiceButton({
    required this.text,
    required this.isPlayer1Selected,
    required this.isPlayer2Selected,
    required this.isMatched,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = isPlayer1Selected || isPlayer2Selected;
    final isBothSelected = isPlayer1Selected && isPlayer2Selected;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isMatched
              ? Colors.green.withOpacity(0.3)
              : isBothSelected && !isMatched
                  ? Colors.white
                  : isSelected
                      ? AppTheme.primaryPeach.withOpacity(0.4)
                      : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isMatched
                ? Colors.green
                : isSelected
                    ? AppTheme.primaryPeach
                    : AppTheme.softCoral,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark,
                  height: 1.3,
                ),
              ),
            ),
            // 선택 표시
            if (isPlayer1Selected)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryPeach,
                    shape: BoxShape.circle,
                  ),
                  child: const Text('1', style: TextStyle(color: Colors.white)),
                ),
              ),
            if (isPlayer2Selected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppTheme.accentRose,
                    shape: BoxShape.circle,
                  ),
                  child: const Text('2', style: TextStyle(color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ResultScreen extends StatelessWidget {
  final int matchPercent;
  final VoidCallback onRestart;

  const _ResultScreen({
    required this.matchPercent,
    required this.onRestart,
  });

  String get emoji {
    if (matchPercent >= 80) return '💕';
    if (matchPercent >= 60) return '😊';
    if (matchPercent >= 40) return '🤔';
    return '😅';
  }

  String get message {
    if (matchPercent >= 80) return '완벽한 케미!';
    if (matchPercent >= 60) return '꽤 잘 맞아요!';
    if (matchPercent >= 40) return '서로 다른 매력이 있네요';
    return '반대의 매력?!';
  }

  String get subMessage {
    if (matchPercent >= 80) return '두 분 정말 잘 어울려요! 💖';
    if (matchPercent >= 60) return '공통점도 많고 좋은 시작이에요!';
    if (matchPercent >= 40) return '다른 점이 있어야 재밌죠! 😉';
    return '극과 극은 통한다! 🔥';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.warmCream,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.5, end: 1.0),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Text(emoji, style: const TextStyle(fontSize: 100)),
                ),
                const SizedBox(height: 32),
                Text(
                  '우리의 취향 궁합',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: matchPercent),
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, value, child) {
                    return Text(
                      '$value%',
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryPeach,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  subMessage,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textLight,
                      ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('홈으로'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: onRestart,
                      child: const Text('다시 하기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

