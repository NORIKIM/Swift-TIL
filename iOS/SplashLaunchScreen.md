# Splash Screen / Launch Screen

Splash(Launch) 화면은 앱 처음 시작 시 몇 초간 보여지는 화면이다. 서비스와 사용자의 중요한 연결 고리로 앱의 전체적인 분위기를 가늠하는 역할을 한다.

작업은 LaunchScreen.storyboard에서 ImageView만을 사용하여 구현한다. 이미지 파일을 무조건 프로젝트 파일 안에 가지고 있어야 하며, 버튼이나 다른 객체의 사용은 불가능하다.

만약 별도의 viewController 파일의 사용이 필요하다면 MainStoryboard에서 이니셜 뷰 설정으로 구현한다.

화면을 구성한 후에는 **App Icons and Launch Images**에서 Launch Screen File이 LaunchScreen으로 설정 되어 있는지 확인하고 스플래시 화면의 딜레이 시간을 설정 할때는 AppDelegate파일에서 **didFinishLauchingWithOptions** 함수에서 sleep(딜레이할 시간)을 넣어준다.

**Launch Screen Constraints**

- The system loads the launch screen file before launching the app which creates some constraints on what it can contain (some of which may force you back to static image files):
- The app is not yet loaded so the view hierarchy does not exist and the system can not call any custom view controller setup code you may have in the app (e.g. viewDidLoad)
- You can only use standard UIKit classes so you can use UIView or UIViewController but not a custom subclass. If you try to set a custom class you will get an Illegal Configuration error in Xcode.
- The launch screen file can only use basic UIKit views such as UIImageView and UILabel. You cannot use a UIWebView.
- If you are using a storyboard you can specify multiple view controllers but there are again some limitations. For example you can embed view controllers in a navigation or tab bar controller but more complex container classes such as UISplitViewController do not work (at least not yet).
- Localizing the launch screen file does not currently seem to have any effect. The base localization is always used so you will probably want to avoid text on the launch screen.
- You cannot specify different launch screen files for iPad and iPhone. This may be a problem if you have significantly different interfaces for those devices as there is only so much you can do with auto layout and size classes.