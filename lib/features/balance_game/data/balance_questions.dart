class BalanceQuestion {
  final String category;
  final String optionA;
  final String optionB;
  final int level;

  const BalanceQuestion({
    required this.category,
    required this.optionA,
    required this.optionB,
    required this.level,
  });
}

class BalanceQuestions {
  static const List<BalanceQuestion> all = [
    // Lv.1 - 음식, 취향 (Ice Breaking)
    BalanceQuestion(
      category: '🍜 음식',
      optionA: '물냉면',
      optionB: '비빔냉면',
      level: 1,
    ),
    BalanceQuestion(
      category: '🍖 음식',
      optionA: '삼겹살에\n소주',
      optionB: '치킨에\n맥주',
      level: 1,
    ),
    BalanceQuestion(
      category: '🍜 음식',
      optionA: '평생\n탄산 끊기',
      optionB: '평생\n라면 끊기',
      level: 1,
    ),
    BalanceQuestion(
      category: '☕ 음료',
      optionA: '아메리카노',
      optionB: '달달한\n라떼',
      level: 1,
    ),
    BalanceQuestion(
      category: '🍕 음식',
      optionA: '피자는\n도미노',
      optionB: '피자는\n피자헛',
      level: 1,
    ),
    BalanceQuestion(
      category: '🍔 음식',
      optionA: '햄버거는\n맥도날드',
      optionB: '햄버거는\n버거킹',
      level: 1,
    ),
    BalanceQuestion(
      category: '🐕 동물',
      optionA: '강아지파',
      optionB: '고양이파',
      level: 1,
    ),
    BalanceQuestion(
      category: '🌅 시간',
      optionA: '아침형\n인간',
      optionB: '저녁형\n인간',
      level: 1,
    ),

    // Lv.2 - 여행, 취미, 라이프스타일 (Values)
    BalanceQuestion(
      category: '✈️ 여행',
      optionA: '휴양지에서\n눕방',
      optionB: '관광지\n탐험',
      level: 2,
    ),
    BalanceQuestion(
      category: '✈️ 여행',
      optionA: '철저한\n계획 여행',
      optionB: '즉흥\n자유 여행',
      level: 2,
    ),
    BalanceQuestion(
      category: '✈️ 여행',
      optionA: '패키지\n여행',
      optionB: '자유\n여행',
      level: 2,
    ),
    BalanceQuestion(
      category: '🏠 주말',
      optionA: '하루 종일\n집에 있기',
      optionB: '무조건\n밖에 나가기',
      level: 2,
    ),
    BalanceQuestion(
      category: '🎬 취미',
      optionA: '넷플릭스\n정주행',
      optionB: '영화관\n관람',
      level: 2,
    ),
    BalanceQuestion(
      category: '💪 운동',
      optionA: '헬스장\n운동',
      optionB: '야외\n러닝',
      level: 2,
    ),
    BalanceQuestion(
      category: '🎵 음악',
      optionA: '조용한\n발라드',
      optionB: '신나는\n댄스곡',
      level: 2,
    ),
    BalanceQuestion(
      category: '📱 라이프',
      optionA: '계획적인\n성격',
      optionB: '즉흥적인\n성격',
      level: 2,
    ),

    // Lv.3 - 연애관, 가치관 (Deep Talk)
    BalanceQuestion(
      category: '💑 연애',
      optionA: '연락은\n틈틈이',
      optionB: '바쁠 땐\n나중에',
      level: 3,
    ),
    BalanceQuestion(
      category: '💑 연애',
      optionA: '매일\n만나기',
      optionB: '주 1~2회\n만나기',
      level: 3,
    ),
    BalanceQuestion(
      category: '💑 연애',
      optionA: '갈등은\n바로 풀기',
      optionB: '시간을 갖고\n정리하기',
      level: 3,
    ),
    BalanceQuestion(
      category: '💑 연애',
      optionA: '애인 이성친구\n식사 가능',
      optionB: '애인 이성친구\n식사 불가',
      level: 3,
    ),
    BalanceQuestion(
      category: '💑 연애',
      optionA: '공개\n연애',
      optionB: '비공개\n연애',
      level: 3,
    ),
    BalanceQuestion(
      category: '💑 연애',
      optionA: '먼저\n연락하는 파',
      optionB: '연락\n기다리는 파',
      level: 3,
    ),
    BalanceQuestion(
      category: '💍 결혼',
      optionA: '빠른\n결혼',
      optionB: '충분히\n연애 후',
      level: 3,
    ),
    BalanceQuestion(
      category: '🏠 미래',
      optionA: '도시\n생활',
      optionB: '시골\n생활',
      level: 3,
    ),
  ];

  static List<BalanceQuestion> getByLevel(int level) {
    return all.where((q) => q.level == level).toList();
  }

  static List<BalanceQuestion> getMixed() {
    final List<BalanceQuestion> mixed = [];
    for (int level = 1; level <= 3; level++) {
      final levelQuestions = getByLevel(level);
      levelQuestions.shuffle();
      mixed.addAll(levelQuestions.take(3));
    }
    return mixed;
  }
}

