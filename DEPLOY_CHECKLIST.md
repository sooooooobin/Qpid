# 배포 반영 확인 체크리스트

## 1단계: 푸시 확인

### GitHub에서 확인
1. https://github.com/bgr2341-boop/Qpid 저장소로 이동
2. **Code** 탭에서 최신 커밋이 보이는지 확인
3. 커밋 메시지가 "메인 페이지 레벨 카드 크기 조정 및 줄바꿈 방지"인지 확인

---

## 2단계: GitHub Actions 확인

1. GitHub 저장소에서 **Actions** 탭 클릭
2. "Build and Deploy Web" 워크플로우가 보이는지 확인
3. 워크플로우 상태 확인:
   - 🟡 노란색 점 = 실행 중 (2-3분 대기)
   - ✅ 초록색 체크 = 성공
   - ❌ 빨간색 X = 실패 (클릭해서 오류 확인)

### 워크플로우가 보이지 않으면:
- Settings > Actions > General로 이동
- "Allow all actions and reusable workflows" 선택
- 저장

---

## 3단계: GitHub Pages 설정 확인

1. GitHub 저장소에서 **Settings** 탭 클릭
2. 왼쪽 메뉴에서 **Pages** 클릭
3. **Source** 섹션 확인:
   - ✅ "GitHub Actions"로 설정되어 있어야 함
   - ❌ "Deploy from a branch"로 되어 있으면 변경 필요

### Pages가 설정되지 않았으면:
1. Source를 **"GitHub Actions"**로 변경
2. **Save** 클릭

---

## 4단계: 배포 완료 확인

### 배포 완료까지 시간:
- 첫 배포: 약 3-5분
- 이후 배포: 약 2-3분

### 배포 완료 확인:
1. Actions 탭에서 워크플로우가 ✅ 초록색 체크 표시
2. Pages 설정에서 "Your site is live at..." 메시지 확인

---

## 5단계: 웹사이트 확인

### 올바른 URL:
- https://bgr2341-boop.github.io/Qpid

### 확인 방법:
1. 브라우저에서 위 URL 접속
2. **강력 새로고침** (캐시 무시):
   - Mac: `Cmd + Shift + R`
   - Windows: `Ctrl + Shift + R`
3. 변경사항이 보이는지 확인

---

## 문제 해결

### 문제 1: Actions가 실행되지 않음
**해결책:**
- Settings > Actions > General
- "Allow all actions" 선택
- 저장 후 다시 푸시

### 문제 2: Pages가 "GitHub Actions"로 설정 안 됨
**해결책:**
- Settings > Pages
- Source를 "GitHub Actions"로 변경
- 저장

### 문제 3: 워크플로우 실패
**해결책:**
- Actions 탭에서 실패한 워크플로우 클릭
- 오류 메시지 확인
- 일반적인 원인:
  - Flutter 버전 문제
  - 의존성 설치 실패

### 문제 4: 웹사이트에 변경사항이 안 보임
**해결책:**
1. 브라우저 캐시 삭제
2. 시크릿 모드에서 접속
3. 배포 완료 후 1-2분 더 대기

---

## 빠른 확인 방법

터미널에서:
```bash
# 최신 커밋 확인
git log --oneline -3

# 원격 저장소와 동기화 확인
git fetch origin
git status
```
