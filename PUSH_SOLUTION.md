# Push 버튼 비활성화 문제 해결

## 현재 상황
- 로컬에 3개의 커밋이 푸시되지 않음
- VS Code의 Push 버튼이 비활성화됨

## 해결 방법

### 방법 1: VS Code에서 수동 푸시 (권장)

1. **Source Control 열기** (`Cmd+Shift+G`)
2. 상단의 **...** (더보기) 메뉴 클릭
3. **Push** 선택
   - Push 버튼이 비활성화되어 있어도 이 메뉴는 작동할 수 있습니다

### 방법 2: 터미널에서 푸시

터미널에서 다음 명령어 실행:

```bash
git push origin main
```

인증 창이 뜨면:
- **Username**: GitHub 사용자명 입력
- **Password**: Personal Access Token 입력 (비밀번호 아님!)

### 방법 3: GitHub CLI 사용 (가장 쉬움)

1. GitHub CLI 설치 (없는 경우):
```bash
brew install gh
```

2. 로그인:
```bash
gh auth login
```

3. 푸시:
```bash
git push origin main
```

### 방법 4: SSH로 변경

터미널에서:

```bash
# SSH로 변경
git remote set-url origin git@github.com:bgr2341-boop/Qpid.git

# 푸시
git push origin main
```

**주의**: SSH 키가 설정되어 있어야 합니다.

---

## VS Code Push 버튼이 비활성화되는 이유

1. **인증 문제**: GitHub 인증이 안 되어 있음
2. **원격 저장소 연결 문제**: origin이 제대로 설정 안 됨
3. **브랜치 추적 문제**: 로컬 브랜치가 원격 브랜치를 추적하지 않음

---

## 빠른 해결책

### 터미널에서 직접 푸시:

```bash
# 현재 상태 확인
git status

# 푸시 시도
git push origin main
```

인증이 필요하면:
- Personal Access Token 생성: https://github.com/settings/tokens
- 토큰을 비밀번호처럼 입력

---

## 푸시 후 확인

1. GitHub 저장소에서 커밋 확인:
   - https://github.com/bgr2341-boop/Qpid
   - Code 탭에서 최신 커밋 확인

2. GitHub Actions 확인:
   - Actions 탭에서 "Build and Deploy Web" 워크플로우 실행 확인

3. 웹사이트 확인:
   - https://bgr2341-boop.github.io/Qpid
   - 강력 새로고침 (`Cmd+Shift+R`)
