# Cocopods
iOS 등 애플의 개발 플랫폼을 이용하다 보면 외부 라이브러리를 사용해야 하는 경우가 생기는데, 이때 외부 라이브러리 들을 쉽게 관리해줄수 있는 스위프트와 오브젝티브c cocoa 프로젝트 의존성 관리 도구이다. 수많은 라이브러리를 보유하고 있으며 많은 앱에서 사용되고 있다.

**사용방법**
<br>
1. 설치
    터미널 실행
    
    ```plain Text
    sudo gem install Cocopods
    ```
    <br>
2. 적용
    터미널을 이용하여 코코아팟을 적용하고 싶은 프로젝트 경로로 들어간다. (xcodeproj파일이 있는곳)
    ```plain Text
    pod init
    ```
    Potfile 생성 확인
    
    <br>
3. 라이브러리 다운
    (Podfile이 있는 경로!) Podfile을 수정하고 저장
    ```plain Text
    vi Podfie

    target "프로젝트명" do

        pod '라이브러리명'

    end
    ```
    <br>
4. pod install
    pod install 을 입력
    
    [!] Automatically ~
    
    [!] Please cloas any ~
    
    라고 뜨면 성공
    
    <br>
5. 프로젝트 import
    이제 xcworkspace로 작업을 한다
    설치한 라이브러리를 import 해준다
    
 

