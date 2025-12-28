enum QuestionType {
  iceBreaking,
  deepTalk,
  balance,
  whatIf,
}

class Question {
  final String text;
  final int level;
  final QuestionType type;
  final String? guide; // 답변 가이드나 예시

  const Question({
    required this.text,
    required this.level,
    required this.type,
    this.guide,
  });
}

class QuestionData {
  // Level 1: 아이스브레이킹 (탐색과 공감)
  static const List<Question> level1Questions = [
    Question(
      text: '오늘 오시는 길에 들었던 노래 중 가장 좋았던 건 뭔가요?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '휴대폰 앱 중에 가장 자주 들어가는 앱 3개는?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '최근에 돈을 쓰고 가장 돈 아깝지 않았던 "내돈내산" 아이템은?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '여행을 간다면 "계획형(P)"인가요, "무계획형(J)"인가요?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '가장 최근에 배달 시켜 먹은 음식은?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '요즘 빠진 취미가 있어요?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '최근에 본 영화나 드라마 추천해주세요!',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '아침형 인간 vs 저녁형 인간?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '휴대폰 배터리 몇 프로에서 충전해요?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '좋아하는 계절은 언제예요?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '강아지파 vs 고양이파?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
    Question(
      text: '단짠단짠 vs 매운거?',
      level: 1,
      type: QuestionType.iceBreaking,
    ),
  ];

  // Level 2: 딥 토크 (가치관과 성향)
  static const List<Question> level2Questions = [
    Question(
      text: '일주일의 자유시간이 생긴다면, 혼자 쉬고 싶나요 친구들을 만나고 싶나요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '나중에 연인과 꼭 함께 해보고 싶은 버킷리스트가 있다면?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '본인이 생각하는 본인의 가장 큰 매력 포인트 3가지는?',
      level: 2,
      type: QuestionType.deepTalk,
      guide: '#귀여움 #성실함 #열정',
    ),
    Question(
      text: '연애할 때 가장 중요하게 생각하는 가치(신뢰, 연락, 유머 등)는 무엇인가요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '인생에서 가장 중요하게 생각하는 건 뭐예요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '10년 후에 어디서 뭐하고 있을 것 같아요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '스트레스 받으면 어떻게 푸세요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '요즘 가장 행복할 때는 언제예요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '친구들이 나를 뭐라고 표현해요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '버킷리스트 중 하나 알려주세요!',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '일과 삶 중에 더 중요한 건 뭐예요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
    Question(
      text: '가장 기억에 남는 선물이 뭐예요?',
      level: 2,
      type: QuestionType.deepTalk,
    ),
  ];

  // Level 3: 밸런스 & 만약에 (케미와 설렘)
  static const List<Question> level3BalanceQuestions = [
    Question(
      text: '매일 연락하지만 표현 안 하는 연인 vs 연락은 뜸하지만 만날 때 표현 폭발하는 연인',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '내가 좋아하는 사람 vs 나를 좋아해 주는 사람',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '연락은 틈틈이 vs 바쁠 땐 나중에',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '매일 만나기 vs 주 1~2회 만나기',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '갈등은 바로 풀기 vs 시간을 갖고 정리하기',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '애인 이성친구 식사 가능 vs 애인 이성친구 식사 불가',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '공개 연애 vs 비공개 연애',
      level: 3,
      type: QuestionType.balance,
    ),
    Question(
      text: '먼저 연락하는 파 vs 연락 기다리는 파',
      level: 3,
      type: QuestionType.balance,
    ),
  ];

  static const List<Question> level3WhatIfQuestions = [
    Question(
      text: '만약 우리가 오늘 영화를 보러 간다면, 로맨스인가요 공포영화인가요?',
      level: 3,
      type: QuestionType.whatIf,
    ),
    Question(
      text: '만약 우리가 오늘 헤어지고 나서 서로가 계속 생각난다면, 누가 먼저 연락할까요?',
      level: 3,
      type: QuestionType.whatIf,
    ),
    Question(
      text: '만약 우리가 여행을 간다면, 해외여행인가요 국내여행인가요?',
      level: 3,
      type: QuestionType.whatIf,
    ),
    Question(
      text: '만약 우리가 데이트를 한다면, 집에서 편하게 vs 밖에서 활동적으로',
      level: 3,
      type: QuestionType.whatIf,
    ),
    Question(
      text: '만약 우리가 음식을 주문한다면, 배달 vs 직접 가서 먹기',
      level: 3,
      type: QuestionType.whatIf,
    ),
    Question(
      text: '만약 우리가 취미를 함께 한다면, 운동 vs 문화생활',
      level: 3,
      type: QuestionType.whatIf,
    ),
  ];

  static List<Question> getByLevel(int level) {
    switch (level) {
      case 1:
        return List.from(level1Questions);
      case 2:
        return List.from(level2Questions);
      case 3:
        return [
          ...level3BalanceQuestions,
          ...level3WhatIfQuestions,
        ];
      default:
        return [];
    }
  }

  static List<Question> getAll() {
    return [
      ...level1Questions,
      ...level2Questions,
      ...level3BalanceQuestions,
      ...level3WhatIfQuestions,
    ];
  }
}

