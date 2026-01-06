# 인증 오류 해결 방법 (401 Error)

## 오류 원인
- GitHub 인증 실패
- Personal Access Token이 필요함

## 해결 방법

### 방법 1: Personal Access Token 생성 및 사용 (권장)

#### 1단계: 토큰 생성
1. https://github.com/settings/tokens 접속
2. **Generate new token** > **Generate new token (classic)** 클릭
3. 설정:
   - **Note**: "Q-pid 프로젝트"
   - **Expiration**: 90 days (또는 No expiration)
   - **Select scopes**: 
     - ✅ **repo** (전체 체크)
     - ✅ **workflow**
4. **Generate token** 클릭
5. **토큰 복사** (한 번만 표시됨!) - 예: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

#### 2단계: Git Credential Helper 설정

터미널에서:

```bash
# macOS Keychain에 자격 증명 저장
git config --global credential.helper osxkeychain

# 또는 메모리에 임시 저장
git config --global credential.helper cache
```

#### 3단계: 푸시 시도

```bash
git push origin main
```

인증 창이 뜨면:
- **Username**: `bgr2341-boop` (GitHub 사용자명)
- **Password**: 생성한 토큰 붙여넣기 (비밀번호 아님!)

---

### 방법 2: URL에 토큰 포함 (빠른 해결)

터미널에서:

```bash
# 토큰을 URL에 포함
git remote set-url origin https://[토큰]@github.com/bgr2341-boop/Qpid.git

# 예시 (실제 토큰으로 교체):
# git remote set-url origin https://ghp_xxxxxxxxxxxx@github.com/bgr2341-boop/Qpid.git

# 푸시
git push origin main
```

**주의**: 이 방법은 보안상 권장하지 않지만, 빠르게 해결할 수 있습니다.

---

### 방법 3: SSH 사용 (가장 안전)

#### 1단계: SSH 키 생성 (없는 경우)

```bash
# SSH 키 생성
ssh-keygen -t ed25519 -C "your_email@example.com"

# 엔터 3번 (기본 설정 사용)
```

#### 2단계: 공개 키 복사

```bash
cat ~/.ssh/id_ed25519.pub
```

#### 3단계: GitHub에 SSH 키 추가

1. https://github.com/settings/ssh/new 접속
2. **Title**: "MacBook Air" 입력
3. **Key**: 위에서 복사한 키 붙여넣기
4. **Add SSH key** 클릭

#### 4단계: 원격 저장소를 SSH로 변경

```bash
git remote set-url origin git@github.com:bgr2341-boop/Qpid.git

# 푸시
git push origin main
```

---

## 가장 빠른 해결책 (지금 바로)

1. **토큰 생성**: https://github.com/settings/tokens
2. **터미널에서 실행**:

```bash
# Credential helper 설정
git config --global credential.helper osxkeychain

# 푸시 시도
git push origin main
```

3. 인증 창에서:
   - Username: `bgr2341-boop`
   - Password: 생성한 토큰 붙여넣기

---

## 토큰 생성 단계별 가이드

1. **GitHub 로그인**: https://github.com
2. **우측 상단 프로필** → **Settings**
3. **왼쪽 메뉴 맨 아래** → **Developer settings**
4. **Personal access tokens** → **Tokens (classic)**
5. **Generate new token (classic)**
6. **Note**: "Q-pid" 입력
7. **Expiration**: 90 days 선택
8. **Select scopes**:
   - ✅ **repo** (전체 체크)
   - ✅ **workflow**
9. **Generate token** 클릭
10. **토큰 복사** (중요!)

토큰 예시: `ghp_1234567890abcdefghijklmnopqrstuvwxyz`
