# 터미널 사용 가이드

## 터미널이란?
- Mac의 명령어 입력 창입니다
- 검은색 또는 흰색 창에 텍스트로 명령어를 입력합니다

## 터미널 열기 방법

### 방법 1: Spotlight 검색 사용 (가장 쉬움)
1. `Cmd + Space` (스페이스바) 누르기
2. "터미널" 또는 "Terminal" 입력
3. **Terminal** 앱 클릭

### 방법 2: Finder에서 찾기
1. **Finder** 열기
2. **응용 프로그램** > **유틸리티** 폴더 열기
3. **터미널** 더블클릭

### 방법 3: VS Code 내장 터미널 사용
1. VS Code 열기
2. `Ctrl + `` (백틱 키, 숫자 1 왼쪽)
3. 또는 상단 메뉴: **Terminal** > **New Terminal**

---

## 터미널 화면 설명

터미널을 열면 이런 화면이 보입니다:

```
soobin@BEXPLORERui-MacBookAir Q-pid %
```

- `soobin@BEXPLORERui-MacBookAir`: 컴퓨터 이름
- `Q-pid`: 현재 폴더 이름
- `%`: 명령어 입력 대기 표시

**이 `%` 뒤에 명령어를 입력하면 됩니다!**

---

## 명령어 입력 방법

### 예시 1: git push
1. 터미널 열기
2. 다음 명령어 입력:
```
git push origin main
```
3. **Enter** 키 누르기

### 예시 2: git config
1. 터미널 열기
2. 다음 명령어 입력:
```
git config --global credential.helper osxkeychain
```
3. **Enter** 키 누르기

---

## 주의사항

### ✅ 올바른 입력
```
soobin@BEXPLORERui-MacBookAir Q-pid % git push origin main
```
- `%` 뒤에 명령어 입력
- Enter 키로 실행

### ❌ 잘못된 입력
- `%` 기호를 함께 입력하지 마세요
- 명령어만 입력하세요

---

## VS Code 터미널 사용 (더 쉬움)

VS Code를 사용 중이라면:

1. **VS Code 열기**
2. **`Ctrl + `` (백틱)** 누르기
   - 숫자 1 왼쪽에 있는 키입니다
   - 또는 상단 메뉴: **Terminal** > **New Terminal**
3. 하단에 터미널 창이 열림
4. 명령어 입력 후 **Enter**

VS Code 터미널의 장점:
- 현재 프로젝트 폴더에 자동으로 위치
- 명령어 복사/붙여넣기 쉬움
- 에러 메시지 확인 용이

---

## 단계별 예시

### 1단계: 터미널 열기
- `Cmd + Space` → "터미널" 입력 → Enter

### 2단계: 프로젝트 폴더로 이동 (필요한 경우)
```
cd ~/Q-pid
```
Enter 키 누르기

### 3단계: 명령어 실행
```
git push origin main
```
Enter 키 누르기

### 4단계: 인증 정보 입력
- Username 입력 후 Enter
- Password (토큰) 입력 후 Enter

---

## 문제 해결

### 터미널이 안 열리는 경우
- Spotlight 검색이 안 되면: Finder > 응용 프로그램 > 유틸리티 > 터미널

### 명령어가 실행 안 되는 경우
- 현재 폴더 확인: `pwd` 입력
- 프로젝트 폴더로 이동: `cd ~/Q-pid`

### VS Code 터미널 사용 권장
- 더 쉽고 편리합니다
- `Ctrl + `` 만 누르면 됩니다
