# 간단한 푸시 방법 (터미널 명령어 없이)

## 방법 1: GitHub Desktop 사용 (가장 쉬움) ⭐

### 1단계: GitHub Desktop 설치
1. https://desktop.github.com/ 접속
2. **Download for macOS** 클릭
3. 설치 파일 실행 및 설치

### 2단계: GitHub Desktop에서 푸시
1. GitHub Desktop 실행
2. **File** > **Add Local Repository** 클릭
3. `/Users/soobin/Q-pid` 폴더 선택
4. 왼쪽 하단에 변경사항이 보임
5. 하단에 커밋 메시지 입력 (예: "변경사항 푸시")
6. **Commit to main** 클릭
7. 상단의 **Push origin** 버튼 클릭
8. GitHub 로그인하면 자동으로 푸시됨!

---

## 방법 2: VS Code에서 다른 방법 시도

### VS Code Source Control에서:
1. `Cmd+Shift+G` (Source Control 열기)
2. 상단의 **...** (더보기) 메뉴 클릭
3. **Remote** > **Add Remote...** 선택
4. 또는 **Pull, Push** 메뉴 확인

### VS Code 터미널 사용:
1. VS Code에서 `Ctrl+`` (백틱) 또는 **Terminal** > **New Terminal**
2. 터미널 창에서:
```bash
git push origin main
```
3. 인증 창이 뜨면 토큰 입력

---

## 방법 3: 웹에서 직접 업로드 (임시 방법)

1. GitHub 저장소로 이동: https://github.com/bgr2341-boop/Qpid
2. **Add file** > **Upload files** 클릭
3. 변경된 파일들을 드래그 앤 드롭
4. 커밋 메시지 입력
5. **Commit changes** 클릭

**주의**: 이 방법은 Git 히스토리를 깨뜨릴 수 있으므로 권장하지 않습니다.

---

## 방법 4: SSH 키 자동 설정

터미널이 작동한다면:

```bash
# SSH 키 확인
ls -la ~/.ssh

# SSH 키가 없으면 생성
ssh-keygen -t ed25519 -C "your_email@example.com"
# 엔터 3번

# 공개 키 복사
cat ~/.ssh/id_ed25519.pub
# 출력된 키 전체 복사

# GitHub에 추가:
# 1. https://github.com/settings/ssh/new 접속
# 2. Title: "MacBook" 입력
# 3. Key: 복사한 키 붙여넣기
# 4. Add SSH key 클릭

# 원격 저장소를 SSH로 변경
git remote set-url origin git@github.com:bgr2341-boop/Qpid.git

# 푸시
git push origin main
```

---

## 가장 추천하는 방법

**GitHub Desktop 사용!**

- GUI로 쉽게 사용 가능
- 인증 자동 처리
- 터미널 명령어 불필요
- 시각적으로 변경사항 확인 가능

---

## 문제 해결

### 터미널이 작동하지 않는 경우:
- GitHub Desktop 사용
- VS Code 내장 터미널 사용
- 웹에서 직접 업로드 (임시)

### 인증이 계속 실패하는 경우:
- Personal Access Token 재생성
- SSH 키 사용
- GitHub Desktop 사용 (자동 인증)
