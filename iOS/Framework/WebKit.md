# WebKit

**WKUserContentController**

자바스크립트의 메시지를 post 하거나 사용자의 스크립트를 웹뷰에 넣기 위한 클래스

웹뷰를 사용할 때 웹에서 네이티브 앱에 있는 함수를 호출

팝업 처리, 로그인 세션 관리 등 웹의 이벤트를 캐치해서 처리해야 할 때 웹쪽과 상황에 따른 인터페이스를 정의 할수 있도록 해줌

**WebView**

```swift
import UIKit
import WebView

class viewController: UIViewController,WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    @IBOutlet weak var webView: WKWebView!
    
  //웹뷰를 로드 시키기 위한 기본 동작 
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // 로컬 html파일을 웹뷰에 띄우기
        guard let url = Bundle.main.url(forResource: "webViewTest", withExtension: "html") else { return }
        webView.loadFileURL(url, allowingReadAccessTo: url)
      
      // 사이트 웹뷰에 띄우기
      guard let url = "사이트 주소" else { return }
      
      // URL 요청 후 로드 시킴
        let request = URLRequest(url: url)
        webView.load(request)
    }
```

참고 : https://g-y-e-o-m.tistory.com/13