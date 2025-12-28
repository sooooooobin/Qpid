# Q-pid 웹 배포 가이드

## 로컬에서 웹 서버 실행하기

### 1. Flutter 설치 확인
```bash
flutter --version
```

### 2. 의존성 설치
```bash
flutter pub get
```

### 3. 웹 빌드
```bash
flutter build web --release
```

### 4. 웹 서버 실행

#### 옵션 1: Flutter 개발 서버 사용
```bash
flutter run -d chrome
```

#### 옵션 2: Python 간단 HTTP 서버 사용
```bash
cd build/web
python3 -m http.server 8000
```
그 다음 브라우저에서 `http://localhost:8000` 접속

#### 옵션 3: Node.js http-server 사용
```bash
npx http-server build/web -p 8000
```
그 다음 브라우저에서 `http://localhost:8000` 접속

## GitHub Pages에 배포하기

### 자동 배포 (GitHub Actions 사용)

1. GitHub 저장소의 Settings > Pages로 이동
2. Source를 "GitHub Actions"로 설정
3. main 브랜치에 push하면 자동으로 빌드 및 배포됩니다
4. 배포 완료 후 `https://[사용자명].github.io/Qpid` 접속

### 수동 배포

1. 웹 빌드 실행:
```bash
flutter build web --release
```

2. `build/web` 폴더의 내용을 GitHub Pages 브랜치(`gh-pages`)에 push

## 현재 상태

앱이 준비되었습니다. 다음 명령어로 로컬에서 실행할 수 있습니다:

```bash
# 의존성 설치
flutter pub get

# 웹 서버 실행 (개발 모드)
flutter run -d chrome

# 또는 빌드 후 서버 실행
flutter build web
cd build/web
python3 -m http.server 8000
```

