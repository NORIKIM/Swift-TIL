# UIKit

**UIProgressView**: 테스크의 동작 시간을 보여줌(값 조정 불가)

**UISlider** : 슬라이드 버튼을 통해 값의 조정이 가능 

- isTracking: UIControl ?

  추적하는 객체가 동작하고 있는지 아닌지를 확인한다.

  ```swift
  time = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (time: Timer) in
                                                                             if self.timeSlider.isTracking { return }
         self.convertTimeString(self.player.currentTime)
              self.timeSlider.value = Float(self.player.currentTime)
          })
  ```

  기본적으로 Timer.scheduledTimer()이 메소드는 withTimeInterval에 대입되는 값인 0.01초 마다 계속 불리게 된다.

  timeSlider를 추적하여 동작이 완료되면 그냥 리턴시키고 아직 동작 중이라면 if 다음의 명령들을 수행

## method

**touchesBegan**: 터치가 발생하면 실행시킬 동작(객체 제외)

- UITextFieldDelegate를 체택 해야한다

- 예제

  화면의 빈 곳을 터치하면 키보드가 내려간다.

  ```swift
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          view.endEditing(true)
      }
  ```

**textFieldShouldReturn()**: 키보드의 리턴 버튼을 눌렀을 때 동작

- UITextFieldDelegate를 체택 해야한다

- 예제

  ```swift
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  ```


**UIColor**

```swift
var color = Color Literal
```

var color = <img width="33" src="https://user-images.githubusercontent.com/31604976/73116960-35da0380-3f82-11ea-8b15-13fcd1715d0c.png">

이런 식으로 컬러값이 아닌 직접 색상을 고를 수 있다.

직접 색상 값을 이용하려면 -> UIColor(red: CGFloat, Green: CGFloat, Blue: CGFloat )

****

- 색상이 틀릴 때

  <img width="545" src="https://user-images.githubusercontent.com/31604976/73117303-b569d180-3f86-11ea-9642-644e878d9859.png">