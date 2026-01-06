# GitHub Desktop 대안 방법

## 방법 1: VS Code Source Control 사용 (권장) ⭐

### VS Code에서 푸시하기

1. **VS Code 열기**
2. **`Cmd+Shift+G`** (Source Control 열기)
   - 또는 왼쪽 사이드바의 Source Control 아이콘 클릭
3. 상단의 **...** (더보기) 메뉴 클릭
4. **Push** 선택
5. 인증 창이 뜨면:
   - GitHub 로그인 또는
   - Personal Access Token 입력

### VS Code 터미널 사용

1. VS Code에서 **`Ctrl+`` (백틱)** 눌러서 터미널 열기
2. 다음 명령어 입력:
```bash
git push origin main
```
3. 인증 정보 입력

---

## 방법 2: 웹에서 직접 파일 수정 (가장 확실함)

GitHub 웹사이트에서 직접 파일을 수정하는 방법:

### 변경된 파일들:
1. `lib/features/home/presentation/home_screen.dart`
2. `lib/core/constants/app_constants.dart`
3. `lib/core/theme/app_theme.dart`

### 단계별 방법:

#### 파일 1: home_screen.dart
1. https://github.com/bgr2341-boop/Qpid/blob/main/lib/features/home/presentation/home_screen.dart 접속
2. **연필 아이콘** (Edit) 클릭
3. VS Code에서 파일 열기
4. 전체 내용 복사 (`Cmd+A`, `Cmd+C`)
5. GitHub 웹사이트에 붙여넣기 (`Cmd+V`)
6. 하단 **Commit changes** 클릭
7. 커밋 메시지 입력: "메인 페이지 레벨 카드 크기 조정"
8. **Commit changes** 클릭

#### 파일 2: app_constants.dart
1. https://github.com/bgr2341-boop/Qpid/blob/main/lib/core/constants/app_constants.dart 접속
2. 위와 동일한 과정 반복

#### 파일 3: app_theme.dart
1. https://github.com/bgr2341-boop/Qpid/blob/main/lib/core/theme/app_theme.dart 접속
2. 위와 동일한 과정 반복

---

## 방법 3: 터미널 문제 해결

### 터미널이 멈춘 경우:

1. **새 터미널 창 열기**
   - `Cmd+T` (새 탭)
   - 또는 터미널 앱을 완전히 종료 후 다시 열기

2. **프로젝트 폴더로 이동**
```bash
cd ~/Q-pid
```

3. **다시 푸시 시도**
```bash
git push origin main
```

4. **인증 정보 입력**
   - Username: `bgr2341-boop`
   - Password: Personal Access Token

---

## 가장 추천하는 방법

**VS Code Source Control 사용!**

1. VS Code에서 `Cmd+Shift+G`
2. **...** 메뉴 > **Push**
3. 인증 정보 입력

이 방법이 가장 간단하고 확실합니다.

---

## Personal Access Token 생성 (필요한 경우)

1. https://github.com/settings/tokens 접속
2. **Generate new token (classic)** 클릭
3. **Note**: "Q-pid" 입력
4. **Expiration**: 90 days 선택
5. **Select scopes**:
   - ✅ **repo** (전체 체크)
   - ✅ **workflow**
6. **Generate token** 클릭
7. **토큰 복사**
