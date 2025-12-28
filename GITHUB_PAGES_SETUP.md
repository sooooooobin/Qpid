# GitHub Pages 배포 설정 가이드

## 1단계: 변경사항 푸시

터미널에서 다음 명령어를 실행하세요:

```bash
git add .
git commit -m "Q-pid 앱 재구성 완료"
git push origin main
```

## 2단계: GitHub Pages 설정

1. GitHub 저장소(`https://github.com/bgr2341-boop/Qpid`)로 이동
2. **Settings** 탭 클릭
3. 왼쪽 메뉴에서 **Pages** 클릭
4. **Source** 섹션에서:
   - **Source**를 `GitHub Actions`로 선택
5. 저장 (Save)

## 3단계: GitHub Actions 워크플로우 확인

1. 저장소의 **Actions** 탭으로 이동
2. "Build and Deploy Web" 워크플로우가 자동으로 실행됩니다
3. 워크플로우가 완료되면 (약 2-3분 소요) 배포가 완료됩니다

## 4단계: 앱 접속

배포가 완료되면 다음 URL로 접속할 수 있습니다:

**https://bgr2341-boop.github.io/Qpid**

또는

**https://[사용자명].github.io/Qpid**

## 문제 해결

### 워크플로우가 실행되지 않는 경우:
- 저장소의 **Settings > Actions > General**로 이동
- "Workflow permissions"에서 "Read and write permissions" 선택
- "Allow GitHub Actions to create and approve pull requests" 체크

### 배포가 실패하는 경우:
- **Actions** 탭에서 실패한 워크플로우 클릭
- 로그를 확인하여 오류 원인 파악
- 일반적인 원인:
  - Flutter 버전 문제
  - 의존성 설치 실패
  - 빌드 오류

## 참고사항

- 첫 배포는 약 2-3분 소요됩니다
- 이후 코드 변경 시 자동으로 재배포됩니다
- 배포된 사이트는 `gh-pages` 브랜치에 저장됩니다

