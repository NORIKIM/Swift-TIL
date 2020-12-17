# Gesture

**간단한 동작은 target action을!**

**정교한 동작은 delegate를!**

- UITabGestureRecognizer

  tabGestureRecognizer가 올라간 뷰 또는 객체를 탭하게 되면 발생하는 액션

  - endEditing(Bool)

  만약, textField에 커서를 올렸다가 빈 화면을 탭하면 키보드가 내려가도록 만든다고 하면!

  스토리보드에 textField를 올리고 view에 Tab Gesture Recognizer를 올린후

  viewController에서 

  ```swift
  @IBAction func tabView(_ sender: UITapGestureRecognizer) {
          view.endEditing(true)
      }
  ```

  스토리보드에서 func tabView를 tab gesture recognizer에 연결해준다.

  <br>

  - GestureRecognizer를 Delegate를 사용하여 연결하는것도 가능하다

  ```swift
  class viewController:UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad {
      super.viewDidLoad()
      
      let gesture = UITabGestureRecognizer()
      gesture.delegate = self
      view.addGestureRecognizer(gesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
      view.endEditing(true)
      return true
    }
  }
  ```

  <br>

## UILabel에 적용

```swift
@IBOutlet weak var fromCountryLB: UILabel!
    
override func viewDidLoad() {
  super.viewDidLoad()
        
  let tapLabel = UITapGestureRecognizer(target:    
  self, action: #selector(self.handle(_:)))
  self.fromCountryLB.isUserInteractionEnabled = true    
  fromCountryLB.addGestureRecognizer(tapLabel)
}
```



## PinchGesture

두 손가락을 이용하는 제스처

- 확대/축소

  pinch 제스처가 사용되면 두 손가락의 거리를 알려주는 scale factor가 증가와 감소를 반복하게 된다.

   scale factor는 처음에 1로 시작하므로 두 손가락의 거리가 변경됨에 따라 다시 1로 맞춰주어야 한다.

  그렇지 않으면 조금만 pinch 액션을 취해도 이미지가 엄청나게 확대 되거나 축소 된다.

  ```swift
  @IBOutlet weak var photo: UIImageView!
  @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
  
  @IBAction func photoZoom(_ sender: Any) {
    photo.isUserInteractionEnabled = true
    photo.transform = photo.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
    pinchGesture.scale = 1.0
  }
  ```

  참고 : https://zeddios.tistory.com/343