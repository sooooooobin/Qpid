# 새 저장소 연결 완료

## 완료된 작업
✅ 새로운 저장소 연결: https://github.com/sooooooobin/Qpid.git
✅ 모든 파일 커밋 완료

## 다음 단계: 푸시하기

### 터미널에서 푸시

터미널에서 다음 명령어를 실행하세요:

```bash
git push -u origin main
```

**주의**: `-u` 옵션은 처음 푸시할 때만 필요합니다. 이후에는 `git push`만 입력하면 됩니다.

### 인증이 필요한 경우

명령어 실행 후 인증 창이 뜨면:

1. **Username**: `sooooooobin` 입력
2. **Password**: Personal Access Token 입력
   - 비밀번호가 아닌 토큰을 입력해야 합니다
   - 토큰이 없으면: https://github.com/settings/tokens 에서 생성

---

## Personal Access Token 생성

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

---

## GitHub Pages 설정

푸시가 완료되면:

1. https://github.com/sooooooobin/Qpid 저장소로 이동
2. **Settings** 탭 클릭
3. 왼쪽 메뉴에서 **Pages** 클릭
4. **Source**를 **"GitHub Actions"**로 설정
5. **Save** 클릭

---

## 웹사이트 URL

배포 완료 후 접속할 URL:
- https://sooooooobin.github.io/Qpid

---

## GitHub Actions 워크플로우

`.github/workflows/web-deploy.yml` 파일이 이미 포함되어 있어서:
- main 브랜치에 푸시하면 자동으로 배포됩니다
- 약 2-3분 후 웹사이트에 반영됩니다
