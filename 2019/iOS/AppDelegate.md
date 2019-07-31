# AppDelegate.swift

기능 : 

1. AppDelegate class 정의한다. App delegate는 앱의 상태변화에 따라 응답하고 컨텐츠가 그려지는 Window를 만듦

2. 입력 이벤트를 받아 전달하는 Run Loop를 만듦

   

```swift
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
```

UIApplicationMain속성의 사용 : AppDelegate class의 이름을 delegate class의 이름으로 전달 하는 것과 동일

Delegate class의 이름을 전달받는 것의 응답으로 시스템은 application 객체를 생성한다. application object는 앱의 Life Cycle을 관리하며, 시스템은 appDelegate class의 인스턴스를 만들고 application object에 할당한 후 시스템은 앱을 띄운다.



AppDelegate class는 UIApplicationDelegate 프로토콜을 채택한다. 이 프로토콜은 앱의 상태변화에 따라 응답을 설정할 수 있도록 사용할 수 있는 메소드들을 정의한다.

AppDelegate class는 단일 프로퍼티인 window를 포함

```swift
var window: UIWindow?
```

이 프로퍼티는 앱의 window에 대한 참조를 저장하고, 앱 계층들 중 root view를 표시(앱의 모든 컨텐츠가 그려지는 곳)하고, optional이다



AppDelegate class는 아래와 같은 메소드를 제공한다.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool

func applicationWillResignActive(_ application: UIApplication)

func applicationDidEnterBackground(_ application: UIApplication)

func applicationWillEnterForeground(_ application: UIApplication)

func applicationDidBecomeActive(_ application: UIApplication)

func applicationWillTerminate(_ application: UIApplication)
```

이 메소드를 이용하여 application object가 app delegate와 통신 할 수 있게 된다.  앱의 상태가 전환되는 동안(앱의 실행, 백그라운드 전환, 종료) application object는 상응하는 delegate메소드를 호출하여 앱의 응답 기회를 준다. 각각의 메소드들은 기본 행동을 가지며 내용을 비우거나 삭제를 하더라고 기본행동을 실행 하게 된다. 

출처:

https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1

 https://itcoolly.tistory.com/159

