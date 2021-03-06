# GIT



## 코드리뷰과정

1. 자신의 github 아이디에 해당하는 브랜치가 없는 경우 브랜치 생성 요청 채널을 통해 브랜치 생성을 요청한다. 프로젝트를 자신의 계정으로 fork한다. 저장소 우측 상단의 fork 버튼을 활용한다.

2. fork한 프로젝트를 자신의 컴퓨터로 clone한다.

   ```
   git clone https://github.com/{본인_아이디}/{저장소 아이디} 
   ex) https://github.com/NORIKIM/swift-laddergame
   ```

3. clone한 프로젝트 이동

   ```
   cd {저장소 아이디}
   ex) cd swift-laddergame
   ```

4. 본인 아이디로 브랜치를 만들기 위한 checkout

   ```
   git checkout -t origin/본인_아이디
   ex) git checkout -t origin/NORIKIM
   ```

5. 기능 구현을 위한 브랜치 생성 (연속번호를 붙여나간다)

   ```
   git checkout -b 브랜치이름
   ex) git checkout -b ladder-step1
   ```

6. commit

   ```swift
   git status //확인
   git rm 파일명 //삭제된 파일
   git add 파일명(or * 모두) // 추가/변경 파일
   git commit -m "메세지" // 커밋
   ```

7. 본인 원격 저장소에 올리기

   ```
   git push --set-upstream origin 브랜치이름
   ex) git push --set-upstream origin ladder-step1
   ```

8. pull request

pull request는 github 서비스에서 진행할 수 있다.

pull request는 original 저장소의 브랜치(자신의 github 아이디)와 앞 단계에서 생성한 브랜치 이름을 기준으로 한다.

```
ex) code-squad/swift-laddergame godrm 브랜치 기준 =>
    NORIKIM/swift-laddergame ladder-step1
```

9. code review 및 push

pull request를 통해 피드백을 받는다. (NORIKIM ← step 브랜치)

코드 리뷰 피드백에 대한 개선 작업을 하고 다시 PUSH한다.

10. 기본(upstream) 브랜치 전환 및 base 저장소 추가하기(최초 시작하기 단계 한번만 하면 됨)

```
git checkout 본인_아이디
git remote add upstream base_저장소_url

ex) git checkout NORIKIM
ex) git remote add upstream <https://github.com/code-squad/swift-laddergame.git
// .git?? 로컬 저장소를 말함
```

위와 같이 base 저장소 추가한 후 remote 브랜치 목록을 본다.

```
git remote -v
```

11. 기본 base 저장소와 sync하기 (PR 보낸 내용을 자신의 기본 저장소와 합치기)

```swift
git checkout NORIKIM
git fetch upstream // 실수로 git fetch만 입력했을 땐 git fetch upstream을 다시 입력해주면 됨
git rebase upstream/본인_아이디
ex) git rebase upstream/NORIKIM

git push
```

12. 다음 미션을 해결할 경우 [5단계 브랜치 생성]부터 다시 진행

[github에서 PR보내고 다시 PR보낼 때 유의 사항](https://youtu.be/CbLNbCUsh5c)

++ 미션을 완료하고 origin 과 upstream의 NORIKIM을 맞추고 싶다면

NORIKIM에서  fetch - rebase upstream -  push

## 파일의 상태

- Untracked : add되지 않은 상태
- Unmodified : add는 되었지만, 수정이 되지 않은 상태
- Modified : 파일이 수정되었으나 commit 준비가 되지 않은 상태
- Staged : 파일 수정이 완료되어 commit 하면 되는 상태

## gitignore

track 의 추적에서 제외 시키기

소스트리에서 해당 브랜치의 우측 상단의 설정-고급-편집

제외 하고 싶은 파일을 적어주면 추척에서 제외 되고

.gitignore 파일을 푸시하면 완료

참고 : [http://kyejusung.com/2015/05/userinterfacestate-xcuserstate-%ED%8C%8C%EC%9D%BC-git-tracking%EC%97%90%EC%84%9C-%EC%A0%9C%EC%99%B8%EC%8B%9C%ED%82%A4%EA%B8%B0/](http://kyejusung.com/2015/05/userinterfacestate-xcuserstate-파일-git-tracking에서-제외시키기/)

**gitignore 파일을 생성하는 간단한 방법**

소스트리 - 우측 설정 - 고급 - 편집

추적을 원하지 않는 파일 확장자(예>*.log)

또는 특정 파일(파일명.확장자)

**gitignore을 해도 추적되는 경우**

.gitignore 파일에 작성한 파일이 이미 버전 관리가 되고 있으면 git은 이 파일을 원래대로 추적한다. 따라서 수동으로 삭제한다.

```swift
git rm --cached 추적되는 파일명
git commit -m "Removed file that shouldn't be tracked"
```

출처 : http://howhansume2.blogspot.com/2016/03/cant-ignore-userinterfacestatexcusersta.html



## 명령어

**브랜치 생성**

```swift
git branch 브랜치명
// 브랜치명은 띄어쓰기 X
```

**브랜치 삭제**

```swift
git branch -d 브랜치명
```

**폴더 삭제**

```swift
rm -r 폴더명
```

**파일 삭제**

```swift
rm 파일명
```

**임시파일 만들기**

: Modify 파일들이 있는 상태에서 다른 브랜치로 옮겨 작업하고 싶을때 , Modify 파일들을 임시폴더에 저장해놓고 다른 브랜치로 옮겨가 작업 후 나중에 다시 가져올 수 있다.

```swift
git stash
```

참고 : https://gmlwjd9405.github.io/2018/05/18/git-stash.html

**현재 브랜치로 push**

```swift
git push origin 현재 브랜치명
```

**빈 브랜치 만들기**

```swift
git chekout --orphan 브랜치명
git rm -rf .
git commit --allow-empty -m "커밋내용(init 브랜치명)"
git push origin 브랜치명
```

빈 브랜치를 생성하게 되면 완전히 분리된 별도의 브랜치가 생성되므로 주의!

**브랜치명 변경**

```swift
git branch -m 변경전 변경후

// 브랜치 명이 변경 된 후 이전 브랜치의 파일을 삭제하자
git push origin :삭제할 이전 브랜치명

// 변경한 새로운 브랜치 업로드
git push --set-upstream origin 새브런치명
```

**브랜치 히스토리 확인**

```swift
git log --all --graph --decorate --oneline
```

**원격저장소 브랜치 확인**

```swift
git branch -r
```

**로컬,원격저장소 브랜치 확인(모든 브랜치)**

```swift
git branch -a
```

**직전 커밋 메시지 변경**

```
git commit --amend 엔터
```

--amend 옵션을 지정하고 다시 커밋(입력화면이 표시되므로 코멘트 수정)

**add 취소**

```swift
git reset HEAD (+파일명)
```

**clone한 저장소의 원격브랜치 작업 확인**

```swift
git chekcout origin/jina
```

원격 브랜치를 먼저 확인 후 원하는 브랜치로 체크아웃한다.

detached HEAD로 체크아웃하게 되며 다른 브랜치로 체크아웃하면 사라진다.

**clone한 저장소의 원격브랜치 체크아웃**

```swift
git checkout -t origin/jina
```

**이미 push한 commit 메세지 변경**

```swift
git rebase HEAD~[거슬러 올라가고 싶은 커밋 수] -i
// 바로 직전 push라면 
// git rebase HEAD~1 -i

이렇게 엔터를 쳐주면 vim이 켜지고 'pick' -> 'reword'로 바꾼 후 저장(:wq!)
푸시했던 커밋 메시지 창이 나타나면 메시지를 수정하고 저장(:wq!)

git push --force
```



## 문제상황 및 해결

master가 아닌 다른 브랜치에서 작업을 완료하고 `git push origin 브랜치명` 후 깃헙에서 pull request를 하라구 알림이 뜬다 -> 머지 제한 걸려있는 마스터나 다른 브랜치에 머지를 하고 싶으면 풀리퀘를 날려! 라는 뜻 비정상인 상황이 아니다 -> 풀리퀘와는 별개로 브랜치 관리만 잘하면 꼬이지 않음





