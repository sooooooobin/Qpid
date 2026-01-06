# Git Push 에러 해결 방법

## 발생한 에러
```
fatal: unable to access 'https://github.com/bgr2341-boop/Qpid.git/': 
error setting certificate verify locations: CAfile: /etc/ssl/cert.pem
```

이것은 SSL 인증서 문제입니다. 다음 방법 중 하나를 사용하세요.

## 해결 방법

### 방법 1: VS Code 사용 (가장 쉬움) ⭐ 권장

1. VS Code에서 **Source Control** 탭 열기 (왼쪽 사이드바, 또는 `Cmd+Shift+G`)
2. 변경사항이 보이면:
   - 각 파일 옆의 **+** 버튼 클릭 (또는 "Stage All Changes" 클릭)
3. 상단에 커밋 메시지 입력 (예: "메인 페이지 수정")
4. **✓ Commit** 버튼 클릭
5. 상단의 **...** (더보기) 메뉴 클릭
6. **Push** 선택

### 방법 2: SSH로 변경하기

터미널에서 다음 명령어 실행:

```bash
# 현재 원격 저장소 확인
git remote -v

# HTTPS를 SSH로 변경
git remote set-url origin git@github.com:bgr2341-boop/Qpid.git

# 다시 푸시 시도
git push origin main
```

**주의**: SSH 키가 설정되어 있어야 합니다.

### 방법 3: SSL 인증서 무시 (임시 해결책)

```bash
git config --global http.sslVerify false
git push origin main
```

**주의**: 보안상 권장하지 않지만, 임시로 사용할 수 있습니다.

### 방법 4: GitHub Desktop 사용

1. GitHub Desktop 앱 다운로드: https://desktop.github.com/
2. 저장소 열기
3. 변경사항 커밋 및 푸시

## 가장 추천하는 방법

**VS Code의 Source Control 기능을 사용하세요!**

VS Code는 자동으로 인증을 처리하므로 터미널보다 쉽습니다.

1. VS Code 열기
2. `Cmd+Shift+G` (Source Control)
3. 변경사항 스테이징 → 커밋 → 푸시
