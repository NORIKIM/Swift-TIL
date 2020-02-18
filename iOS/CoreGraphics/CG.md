# CG...

## CGPoint

2차원 좌표의 x,y점을 포함하는 구조체



## CGSize

width와 height 값을 포함하는 구조체

(실제로 사각형으로 간주되지 않는다)



## CGRect

사각형의 **위치**와 **크기**를 포함하는 구조체

(현실에서는 너비와 높이만 있어도 사각형을 그릴 수 있지만 iOS에서는 위치를 알아야 사각형을 그릴 수 있다.)

```swift
public struct CGRect {
  public var origin: CGPoint
  public var size: CGSize
  public init()
  public init(origin: CGPoint, size: CGSize)
}
```



## CGFloat

실수를 사용할 때 사용된다.

CGFloat 외 Float과 Double도 실수를 표현할 때 사용되는데 32비트와 64비트에서의 실수 처리에서 차이가 난다. 이에 대해 개발자가 신경쓰지 않고 사용 할 수 있도록 해주는 것이 CGFloat이다.

**CGFloat은 32비트에서는 Float으로 처리하고 64비트 에서는 Double로 처리한다.**