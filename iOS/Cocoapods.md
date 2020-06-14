# Cocopods
iOS 등 애플의 개발 플랫폼을 이용하다 보면 외부 라이브러리를 사용해야 하는 경우가 생기는데, 이때 외부 라이브러리 들을 쉽게 관리해줄수 있는 스위프트와 오브젝티브c cocoa 프로젝트 의존성 관리 도구이다. 수많은 라이브러리를 보유하고 있으며 많은 앱에서 사용되고 있다.

#### 주의 사항

프로젝트 이름과 코코아팟 이름과 동일하면 안된다.

## 사용방법

<br>

1. 설치
    터미널 실행
    
    ```plain Text
    sudo gem install cocoapods
    ```
    <br>
    
    터미널 삭제
    
    ```swif
    sudo gem uninstall cocoapods
    ```
    
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

## 라이브러리


**AfriwanLib**

안드로이드의 toast 구현

https://diponten.com/2019/07/08/toast/

코코아팟을 이용하면 쉽게 구현가능하다
```plain Text
target 'MyApp' do
  pod 'AfriwanLib'
end
```
```swift
import AfriwanLib
toast(message: "your message", view: self.view)
```

**RealmSwift**

1. RealmSwift를 먼저 설치해준다

   https://realm.io/docs/swift/latest

2. pod init -> pod install

   설치 시 아래의 오류가 발생하면

   ```swift
   // example
   ――― MARKDOWN TEMPLATE ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
   
   ### Command
   
   ​```
   /usr/local/bin/pod install
   ​```
   
   .
   .
   .
   
   ### Error
   
   ​```
   JSON::ParserError - 767: unexpected token at ''
   /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/json/common.rb:156:in `parse'
   /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/json/common.rb:156:in `parse'
   
   .
   .
   .
   
   ――― TEMPLATE END ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
   
   [!] Oh no, an error occurred.
   ```

   ***rm -rf ~/.cocoapods/repos/trunk/***를 입력 후에 다시 pod install 시도해본다.

3. 또 아래와 같은 오류가 발생한다면

   ```swift
   Analyzing dependencies
   Adding spec repo `trunk` with CDN `https://cdn.cocoapods.org/`
   Downloading dependencies
   Installing Realm (4.3.2)
   Installing RealmSwift (4.3.2)
   [!] The following Swift pods cannot yet be integrated as static libraries:
   
   The Swift pod `RealmSwift` depends upon `Realm`, which does not define modules. To opt into those targets generating module maps (which is necessary to import them from Swift when building as static libraries), you may set `use_modular_headers!` globally in your Podfile, or specify `:modular_headers => true` for particular dependencies.
   
   [!] Automatically assigning platform `iOS` with version `13.2` on target `RealmTutorial` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.
   ```

   Podfile을 수정해야한다.

   버전을 추가하고 모듈헤드를 추가해준다.

   ```swift
   target 'RealmTutorial' do                                                       
   
   use_modular_headers!                                                            
   
   pod 'RealmSwift', '~> 3.17', :modular_headers => true
   ```

4. 다시 pod install 해주면 정상 설치된다.

**RxSwift**

```swift
target 'RXSwift' do

pod 'RxSwift'
pod 'RxCocoa'

end
```

