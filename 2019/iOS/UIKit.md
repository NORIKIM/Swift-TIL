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