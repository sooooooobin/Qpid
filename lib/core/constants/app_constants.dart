class AppConstants {
  static const String appName = 'Q-pid';
  static const String appTagline = '오늘 두 분의 만남을 응원해요!';

  // 레벨 정보
  static const Map<int, LevelInfo> levels = {
    1: LevelInfo(
      emoji: '🧊',
      title: '아이스브레이킹',
      subtitle: '첫 만남의 어색함을 녹여봐요',
      description: '가벼운 취향 위주',
    ),
    2: LevelInfo(
      emoji: '💬',
      title: '딥 토크',
      subtitle: '조금 더 깊이 서로를 알아가요',
      description: '가치관, 라이프스타일',
    ),
    3: LevelInfo(
      emoji: '⚖️',
      title: '밸런스/만약에',
      subtitle: '둘만의 케미를 확인하는 짜릿한 선택',
      description: '장난스러운 분위기 속에서 묘한 텐션 만들기',
    ),
  };

  // PASS 최대 횟수
  static const int maxPassCount = 3;
}

class LevelInfo {
  final String emoji;
  final String title;
  final String subtitle;
  final String description;

  const LevelInfo({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

// 