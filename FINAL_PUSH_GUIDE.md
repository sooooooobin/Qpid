# 최종 푸시 가이드

## 현재 상황
✅ 원격 저장소를 새 저장소로 변경 완료: https://github.com/sooooooobin/Qpid.git
✅ 모든 파일 커밋 완료

## 푸시 방법

### 터미널에서 실행

터미널에 다음 명령어를 입력하세요:

```bash
git push -u origin main
```

**주의**: `-u` 옵션은 처음 푸시할 때만 필요합니다.

---

## 인증 정보 입력

명령어 실행 후 인증 창이 뜨면:

1. **Username**: `sooooooobin` 입력 후 Enter
2. **Password**: **Personal Access Token** 입력 후 Enter
   - ⚠️ 비밀번호가 아닌 토큰을 입력해야 합니다!

---

## Personal Access Token 생성 (필요한 경우)

토큰이 없다면:

1. https://github.com/settings/tokens 접속
2. **Generate new token (classic)** 클릭
3. 설정:
   - **Note**: "Q-pid 프로젝트"
   - **Expiration**: 90 days
   - **Select scopes**:
     - ✅ **repo** (전체 체크)
     - ✅ **workflow**
4. **Generate token** 클릭
5. **토큰 복사** (한 번만 표시됨!)
   - 형식: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

---

## 푸시 후 확인

1. **GitHub 저장소 확인**:
   - https://github.com/sooooooobin/Qpid
   - Code 탭에서 파일들이 보이는지 확인

2. **GitHub Pages 설정**:
   - Settings > Pages
   - Source를 **"GitHub Actions"**로 설정
   - Save

3. **웹사이트 확인**:
   - https://sooooooobin.github.io/Qpid
   - 약 2-3분 후 접속

---

## 문제 해결

### 인증 오류가 계속 나는 경우

터미널에서:

```bash
# 원격 저장소 확인
git remote -v

# HTTPS로 확실히 설정
git remote set-url origin https://github.com/sooooooobin/Qpid.git

# 다시 푸시
git push -u origin main
```

### 토큰 입력이 안 되는 경우

- 터미널에서 토큰 입력 시 화면에 표시되지 않을 수 있습니다 (보안상 정상)
- 그냥 토큰을 붙여넣고 Enter를 누르세요

---

## 최종 체크리스트

- [ ] Personal Access Token 생성 완료
- [ ] 터미널에서 `git push -u origin main` 실행
- [ ] Username: `sooooooobin` 입력
- [ ] Password: 토큰 입력
- [ ] GitHub 저장소에서 파일 확인
- [ ] GitHub Pages 설정 완료
