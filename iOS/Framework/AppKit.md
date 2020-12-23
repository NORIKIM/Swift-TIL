# AppKit

## Instance Method

**touchesBegan**: 터치가 발생하면 실행시킬 동작(객체 제외)

- UITextFieldDelegate를 체택 해야한다

- 예제

  화면의 빈 곳을 터치하면 키보드가 내려간다.

  ```swift
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          view.endEditing(true)
   }
  ```
