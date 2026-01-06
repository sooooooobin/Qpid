# SSH 오류 해결 방법

## 발생한 오류
```
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.
```

## 원인
- 원격 저장소가 SSH로 설정되어 있음
- SSH 키가 설정되지 않음

## 해결 방법

### 방법 1: HTTPS로 변경 (가장 쉬움) ⭐

터미널에서:

```bash
# 원격 저장소를 HTTPS로 변경
git remote set-url origin https://github.com/bgr2341-boop/Qpid.git

# 다시 푸시 시도
git push origin main
```

이제 Personal Access Token을 사용하여 인증할 수 있습니다.

---

### 방법 2: SSH 키 설정 (선택사항)

SSH를 사용하고 싶다면:

#### 1단계: SSH 키 생성
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
# 엔터 3번 (기본 설정 사용)
```

#### 2단계: 공개 키 복사
```bash
cat ~/.ssh/id_ed25519.pub
# 출력된 키 전체 복사
```

#### 3단계: GitHub에 SSH 키 추가
1. https://github.com/settings/ssh/new 접속
2. **Title**: "MacBook Air" 입력
3. **Key**: 복사한 키 붙여넣기
4. **Add SSH key** 클릭

#### 4단계: 푸시
```bash
git push origin main
```

---

## 권장 방법

**HTTPS로 변경하는 것이 가장 쉽습니다!**

터미널에서:
```bash
git remote set-url origin https://github.com/bgr2341-boop/Qpid.git
git push origin main
```

그 다음 Personal Access Token을 입력하면 됩니다.
