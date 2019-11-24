# Gesture

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

  GestureRecognizer를 Delegate를 사용하여 연결하는것도 가능하다

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

  **간단한 동작은 target action을!**

  **정교한 동작은 delegate를!**