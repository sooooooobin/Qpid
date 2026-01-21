# 배포 성공 가이드

## 푸시 완료 후 확인 사항

### 1단계: GitHub 저장소 확인

1. https://github.com/sooooooobin/Qpid 접속
2. **Code** 탭에서 파일들이 보이는지 확인
3. 최신 커밋이 "Q-pid 앱 초기 커밋"인지 확인

---

### 2단계: GitHub Pages 설정

1. GitHub 저장소에서 **Settings** 탭 클릭
2. 왼쪽 메뉴에서 **Pages** 클릭
3. **Source** 섹션에서:
   - **Source**를 **"GitHub Actions"**로 선택
4. **Save** 클릭

---

### 3단계: GitHub Actions 확인

1. **Actions** 탭 클릭
2. "Build and Deploy Web" 워크플로우가 자동으로 실행됩니다
3. 워크플로우 상태 확인:
   - 🟡 노란색 점 = 실행 중 (2-3분 대기)
   - ✅ 초록색 체크 = 성공
   - ❌ 빨간색 X = 실패 (클릭해서 오류 확인)

---

### 4단계: 웹사이트 확인

배포 완료 후 (약 2-3분):

1. **웹사이트 접속**: https://sooooooobin.github.io/Qpid
2. **강력 새로고침**: `Cmd+Shift+R` (캐시 무시)
3. 변경사항이 반영되었는지 확인

---

## 문제 해결

### 워크플로우가 실행되지 않는 경우

1. **Settings > Actions > General**로 이동
2. "Workflow permissions"에서 **"Read and write permissions"** 선택
3. "Allow GitHub Actions to create and approve pull requests" 체크
4. **Save** 클릭

### 배포가 실패하는 경우

1. **Actions** 탭에서 실패한 워크플로우 클릭
2. 로그를 확인하여 오류 원인 파악
3. 일반적인 원인:
   - Flutter 버전 문제
   - 의존성 설치 실패
   - 빌드 오류

### 웹사이트에 변경사항이 안 보이는 경우

1. 브라우저 캐시 삭제
2. 시크릿 모드에서 접속
3. 배포 완료 후 1-2분 더 대기

---

## 성공 확인 체크리스트

- [ ] GitHub 저장소에 파일들이 보임
- [ ] GitHub Pages 설정 완료 (Source: GitHub Actions)
- [ ] GitHub Actions 워크플로우 실행 중/완료
- [ ] 웹사이트 접속 가능: https://sooooooobin.github.io/Qpid
- [ ] 앱이 정상적으로 작동함

---

## 다음 단계

배포가 완료되면:

1. 웹사이트 URL 공유 가능: https://sooooooobin.github.io/Qpid
2. 이후 코드 변경 시:
   - 변경사항 커밋
   - 푸시 (`git push origin main`)
   - 자동으로 재배포됨 (약 2-3분)

축하합니다! 🎉
