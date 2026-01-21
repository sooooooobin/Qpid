# 웹에서 직접 파일 업로드 가이드 (가장 확실한 방법)

터미널 인증이 계속 실패하므로, GitHub 웹사이트에서 직접 파일을 업로드하는 방법입니다.

## 방법 1: GitHub 웹에서 파일 직접 업로드

### 1단계: 새 파일 추가

1. https://github.com/sooooooobin/Qpid 접속
2. **Add file** 버튼 클릭
3. **Upload files** 선택
4. VS Code에서 파일들을 드래그 앤 드롭

### 2단계: 업로드할 주요 파일들

다음 파일들을 업로드하세요:

**핵심 파일들:**
- `lib/main.dart`
- `lib/app.dart`
- `lib/core/constants/app_constants.dart`
- `lib/core/theme/app_theme.dart`
- `lib/features/home/presentation/home_screen.dart`
- `lib/features/splash/presentation/splash_screen.dart`
- `lib/features/question/presentation/question_card_screen.dart`
- `lib/features/question/data/question_data.dart`
- `lib/features/saved_questions/presentation/saved_questions_screen.dart`
- `lib/features/saved_questions/data/saved_questions_repository.dart`
- `lib/features/manner_guide/presentation/manner_guide_screen.dart`
- `pubspec.yaml`
- `.github/workflows/web-deploy.yml`

**폴더 구조:**
- `lib/` 폴더 전체
- `.github/workflows/` 폴더

### 3단계: 커밋

1. 하단에 커밋 메시지 입력: "Q-pid 앱 초기 커밋"
2. **Commit changes** 클릭

---

## 방법 2: URL에 토큰 포함 (고급)

터미널에서:

```bash
# Personal Access Token을 URL에 포함
git remote set-url origin https://[토큰]@github.com/sooooooobin/Qpid.git

# 예시 (실제 토큰으로 교체):
# git remote set-url origin https://ghp_xxxxxxxxxxxx@github.com/sooooooobin/Qpid.git

# 푸시
git push -u origin main
```

**주의**: 이 방법은 보안상 권장하지 않지만, 빠르게 해결할 수 있습니다.

---

## 방법 3: 빌드된 파일만 업로드

이미 `flutter build web`이 완료되었다면:

1. https://github.com/sooooooobin/Qpid 접속
2. **Add file** > **Upload files**
3. `build/web` 폴더의 내용을 업로드
4. 커밋 메시지: "웹 빌드 파일"
5. **Commit changes**

그 다음 GitHub Pages 설정:
- Settings > Pages
- Source를 **"Deploy from a branch"**로 설정
- Branch를 `main` / `/build/web` 선택

---

## 가장 추천하는 방법

**방법 1: GitHub 웹에서 직접 업로드**

이 방법이 가장 확실하고 인증 문제를 완전히 우회합니다.

1. GitHub 저장소로 이동
2. **Add file** > **Upload files**
3. VS Code에서 `lib` 폴더 전체 드래그 앤 드롭
4. `pubspec.yaml`, `.github` 폴더도 업로드
5. 커밋

---

## 빠른 업로드 순서

1. https://github.com/sooooooobin/Qpid 접속
2. **Add file** > **Upload files** 클릭
3. Finder에서 `/Users/soobin/Q-pid` 폴더 열기
4. 다음을 드래그 앤 드롭:
   - `lib` 폴더 전체
   - `pubspec.yaml`
   - `.github` 폴더 (있는 경우)
5. 커밋 메시지 입력
6. **Commit changes** 클릭

이 방법이 가장 확실합니다!
