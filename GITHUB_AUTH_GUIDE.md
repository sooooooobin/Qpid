# GitHub 인증 코드 생성 가이드

## Personal Access Token 생성하기

### 1단계: GitHub에서 토큰 생성

1. **GitHub 웹사이트 로그인**: https://github.com
2. 우측 상단 **프로필 아이콘** 클릭
3. **Settings** 클릭
4. 왼쪽 메뉴 맨 아래 **Developer settings** 클릭
5. **Personal access tokens** > **Tokens (classic)** 클릭
6. **Generate new token** > **Generate new token (classic)** 클릭

### 2단계: 토큰 설정

1. **Note**: 토큰 이름 입력 (예: "Q-pid 프로젝트")
2. **Expiration**: 만료 기간 선택 (90 days 또는 No expiration)
3. **Select scopes**: 다음 항목 체크:
   - ✅ **repo** (전체 체크)
   - ✅ **workflow** (GitHub Actions 사용 시)

4. 맨 아래 **Generate token** 버튼 클릭

### 3단계: 토큰 복사 ⚠️ 중요!

**토큰이 한 번만 표시됩니다!** 바로 복사하세요!

예시: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

### 4단계: 터미널에서 사용

터미널에서 푸시할 때 비밀번호 대신 이 토큰을 입력하세요:

```bash
git push origin main
```

- Username: GitHub 사용자명 입력
- Password: **생성한 토큰** 입력 (토큰 전체 복사해서 붙여넣기)

---

## 더 쉬운 방법: VS Code 사용

VS Code를 사용하면 토큰을 한 번만 입력하면 자동으로 저장됩니다:

1. VS Code에서 Source Control 열기
2. Push 시도
3. GitHub 로그인 창이 뜨면:
   - **Sign in with GitHub** 클릭
   - 또는 토큰을 입력하면 자동 저장됨

---

## SSH 키 사용 (대안)

토큰 대신 SSH 키를 사용할 수도 있습니다:

```bash
# SSH 키 생성 (이미 있으면 생략)
ssh-keygen -t ed25519 -C "your_email@example.com"

# 공개 키 복사
cat ~/.ssh/id_ed25519.pub

# GitHub에 SSH 키 추가:
# 1. GitHub > Settings > SSH and GPG keys
# 2. New SSH key 클릭
# 3. 위에서 복사한 키 붙여넣기

# 원격 저장소를 SSH로 변경
git remote set-url origin git@github.com:bgr2341-boop/Qpid.git
```

---

## 주의사항

⚠️ **토큰은 비밀번호처럼 취급하세요!**
- 다른 사람과 공유하지 마세요
- GitHub에 커밋하지 마세요
- 토큰이 유출되면 즉시 삭제하세요
