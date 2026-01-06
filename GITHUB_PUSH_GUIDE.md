# GitHub 푸시 및 자동 배포 가이드

## GitHub 푸시란?

GitHub 푸시는 **터미널에서 git 명령어**로 하는 것입니다. Review 버튼이 아닙니다!

## 자동 배포 설정 완료 ✅

현재 프로젝트는 GitHub Actions가 설정되어 있어서:
- **main 브랜치에 푸시하면 자동으로 웹사이트가 배포됩니다**
- 약 2-3분 후에 https://bgr2341-boop.github.io/Qpid 에 반영됩니다

## 푸시 방법

### 방법 1: 터미널에서 직접 푸시 (권장)

터미널에서 다음 명령어를 실행하세요:

```bash
# 1. 변경사항 추가
git add .

# 2. 커밋 (변경사항 저장)
git commit -m "변경사항 설명"

# 3. GitHub에 푸시
git push origin main
```

### 방법 2: VS Code나 다른 에디터 사용

1. **Source Control** 탭 열기 (Ctrl+Shift+G 또는 Cmd+Shift+G)
2. 변경된 파일 옆의 **+** 버튼 클릭 (스테이징)
3. 커밋 메시지 입력
4. **✓ Commit** 버튼 클릭
5. **...** 메뉴에서 **Push** 선택

## 배포 확인 방법

### 1. GitHub Actions 확인
1. GitHub 저장소로 이동: https://github.com/bgr2341-boop/Qpid
2. **Actions** 탭 클릭
3. "Build and Deploy Web" 워크플로우가 실행 중인지 확인
4. 초록색 체크 표시가 나타나면 배포 완료!

### 2. 웹사이트 확인
배포 완료 후 (약 2-3분):
- https://bgr2341-boop.github.io/Qpid 접속
- 변경사항이 반영되었는지 확인

## 실시간 반영

✅ **자동으로 실시간 반영됩니다!**

- main 브랜치에 푸시할 때마다 자동으로 배포됩니다
- 배포는 약 2-3분 소요됩니다
- 배포 완료 후 웹사이트에 자동으로 반영됩니다

## 문제 해결

### 푸시가 안 될 때
- GitHub 인증 확인 필요
- Personal Access Token 설정 필요할 수 있음

### 배포가 안 될 때
- GitHub 저장소 Settings > Pages에서 Source를 "GitHub Actions"로 설정했는지 확인
- Actions 탭에서 오류 메시지 확인
