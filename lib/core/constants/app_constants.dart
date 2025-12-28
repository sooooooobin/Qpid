class AppConstants {
  static const String appName = '소개팅 윙맨';
  static const String appTagline = '어색한 침묵은 이제 그만!';

  // 레벨 정보
  static const Map<int, LevelInfo> levels = {
    1: LevelInfo(
      emoji: '🧊',
      title: 'Ice Breaking',
      subtitle: '처음 만나 어색할 때\n가벼운 취향 이야기',
    ),
    2: LevelInfo(
      emoji: '💬',
      title: 'Values',
      subtitle: '분위기가 풀렸을 때\n연애관 & 라이프스타일',
    ),
    3: LevelInfo(
      emoji: '🌙',
      title: 'Deep Talk',
      subtitle: '2차 가기 전\n진솔한 속마음 이야기',
    ),
  };

  // PASS 최대 횟수
  static const int maxPassCount = 3;
}

class LevelInfo {
  final String emoji;
  final String title;
  final String subtitle;

  const LevelInfo({
    required this.emoji,
    required this.title,
    required this.subtitle,
  });
}

