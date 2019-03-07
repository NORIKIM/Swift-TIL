**2019.03.07**

#Delegation Design Pattern



Delegate:

때에따라 유연하게 동작할 수 있도록 해줌

하나의 딜리게이트로 여러 뷰에서 동작 할 수 있도록 해줌

동작을 확인하기 위한 것

프로토콜을 활용하여 만들며, 구현체의 분리에 용이



- UITextField를 이용하여 구현해보자

```swift
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enteredLable: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // UITextFieldDelegate를 위임받기 위해 비활성화
//    @IBAction func buttonClicked(_ sender: Any) {
//        enteredLable.text = textField.text
//    }
    
    
    // @IBAction을 통해 글을 옮겨주는 것을 대신해주는 함수를 선언
    // 이상태로 실행하게 되면 클릭버튼이 비활성화 되있으므로 엔터버튼을 눌러 실행 시키게됨
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enteredLable.text = textField.text
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self // 위임자(viewController)가 누구인지 알려준다. "너한테 이벤트가 발생하면 프로토콜에 따라 너에게 응답을 줄게."
    }
}
```

![delegate적용전](/Users/jina/Desktop/image/delegate적용전.png)

![delegate적용후](/Users/jina/Desktop/image/delegate적용후.png)

