# UIKit

## UIProgressView

테스크의 동작 시간을 보여줌(값 조정 불가)

## UISlider

슬라이드 버튼을 통해 값의 조정이 가능 

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

thumb 사이즈 및 이미지 변경

- thumb 사이즈를 조절해주는 속성이 없으므로 setThumbImage메소드를 사용하여 커스텀한다.

  별도 이미지를 넣어주거나 UIView를 이용해 모양을 만들어 적용한다.

  ```swift
  // thumb 원형의 모양을 살리고 싶다면 이렇게 UIView를 이용하여 커스텀한다.
  func sliderThumbImage() -> UIImage {
          // thumb모양을 만들어줄 뷰
          let thumbView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 13))
          thumbView.backgroundColor = #colorLiteral(red: 0.2717596889, green: 0.2611109018, blue: 0.9987623096, alpha: 1)
          thumbView.layer.cornerRadius = thumbView.frame.height / 2
          
          // thumb UIView를 UIImage로 변환하여 리턴
          let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
          return renderer.image { (context) in
              thumbView.layer.render(in: context.cgContext)
          }
  }
  ```

  ```swift
  let thumbImg = self.sliderThumbImage()
  self.timeSlider.setThumbImage(thumbImg, for: .normal)
  self.timeSlider.setThumbImage(thumbImg, for: .highlighted)
  ```

  

## UIColor

```swift
var color = Color Literal
```

var color = <img width="33" src="https://user-images.githubusercontent.com/31604976/73116960-35da0380-3f82-11ea-8b15-13fcd1715d0c.png">

이런 식으로 컬러값이 아닌 직접 색상을 고를 수 있다.

직접 색상 값을 이용하려면 -> UIColor(red: CGFloat, Green: CGFloat, Blue: CGFloat )

****

- 색상이 틀릴 때

  <img width="545" src="https://user-images.githubusercontent.com/31604976/73117303-b569d180-3f86-11ea-9642-644e878d9859.png">
## UIImageView

이미지뷰의 파일 이름을 가지고 오고 싶을 때

```swift
let img = UIImage(name: "사진")
이미지뷰 객체명.restorationIdentifier = "사진"
```

URL을 이용해 이미지 넣어주기

```swift
//url에 정확한 이미지 url 주소를 넣는다.
let url = URL(string: image.url)
var image : UIImage?
//DispatchQueue를 쓰는 이유 -> 이미지가 클 경우 이미지를 다운로드 받기 까지 잠깐의 멈춤이 생길수 있다. (이유 : 싱글 쓰레드로 작동되기때문에)
//DispatchQueue를 쓰면 멀티 쓰레드로 이미지가 클경우에도 멈춤이 생기지 않는다.
DispatchQueue.global().async {
  let data = try? Data(contentsOf: url!)
  DispatchQueue.main.async {
    image = UIImage(data: data!)
  }
}
```



## *Class--------------------------*

## UIButton

시스템이미지 적용

```swift
버튼.setImage(UIImage(systemName: "play.fill"), for: .normal)
```



## UINavigaionController

 ► UINavigationBar

<img width="630" src="https://user-images.githubusercontent.com/31604976/74205651-9de75400-4cbb-11ea-83ad-6f470ff1895b.png">

- Color

    Bar Tint: 네비게이션 바 자체 배경 색
    

<img width="405" src="https://user-images.githubusercontent.com/31604976/74206131-64174d00-4cbd-11ea-8ee5-ec6d87c23fe7.png">
    
    Large Title Color: 왼쪽 사진
    
    Title Color: 오른쪽 사진
    
    Background:바 버튼 항목의 배경
    
    Tint: 바 버튼 항목의 폰트 색상

​    

## UITextField

텍스트 필드에 값 입력시 왼쪽 끝이 아닌 위치 커스텀하기

```swift
let padding = UIView(frame: CGRect(x: 0, y: 0, width: prefixLB.frame.width + 20, height: 34)))
currencyTF.leftView = padding
currencyTF.leftViewMode = .always
```

<img src="https://user-images.githubusercontent.com/31604976/75735051-ee8f2180-5d3c-11ea-9ec6-3d27fca26eb9.png">

**textFieldShouldReturn()**: 키보드의 리턴 버튼을 눌렀을 때 동작

- UITextFieldDelegate를 체택 해야한다

- 예제

  ```swift
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  ```



## UIBlurEffect

설정하려는 뷰의 뒤를 블러처리해주는 클래스

```swift
let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
blurEffectView = UIVisualEffectView(effect: blurEffect)
blurEffectView.frame = self.view.bounds
blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
self.view.addSubview(blurEffectView)
```

<img width=300 src="https://user-images.githubusercontent.com/31604976/99070362-67948780-25f3-11eb-9083-f3616e0cf56c.PNG">

## UIScrollView

스크롤뷰를 사용하여 이미지 확대 및 축소

```swift
스토리보드에서 스크롤뷰를 생성하면 자동으로 스크롤뷰 내에 생기는 Layout Guide는 삭제한 후 스크롤뷰에 들어갈 객체를 삽입한다.
```

```swift
class ViewController: UIViewController, UIScrollViewDelegate {
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView.alwaysBounceVertical = false
    scrollView.alwaysBounceHorizontal = false
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 2.0
    scrollView.delegate = self
  }
}
```

## UILabel

코드로 생성

```swift
let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
self.view.addSubview(lb)
```

줄바꿈

```swift
lb.text = "first \n second \n third"
lb.numberOfLines = 3
```

## UIScrollView

컨테인 뷰를 스크롤링하고 확대해주는 뷰

스크롤뷰는 content와 frame을 효과적으로 제어하기 위해 기본적으로 Content Layout Guide와 Frame Layout Guide를 제공한다.

- Content Layout Guide와 Frame Layout Guide

  Content Layout Guide : 컨텐츠 영역과 관련된 오토레이아웃 제약 조건을 만들 때 사용

  Frame Layout Guide : 스크롤뷰 자체 오토레이아웃 제약 조건을 만들 때 사용

> 스크롤뷰를 사용하기 위해서는 스크롤뷰 안에 보여지는 컨텐츠의 사이즈를 꼭 정해줘야 한다. 



## *Struct--------------------------------*

## UIInterfaceOrientationMask

기기의 화면의 방향 설정

- portrait : 뒤집기 불가
- landscapeLeft : 가로 왼쪽만
- landscapeRight : 가로 오른쪽만
- portraitUpsideDown : 뒤집기 포함한 세로
- landscape : 가로
- all : 모든 방향
- allButUpsideDown : 세로뒤집기 제외 모든방향

## *Function------------------------------*

## UIGrapicsBeginImageContextWithOptions

비트맵 이미지를 특정 옵션을 통해 생성한다.

```swift
UIGrapicsBeginImageContextWithOptions(size: CGSize, opaque: Bool, scale: CGFloat) 
```

size: UIGraphicsGetImageFromCurrentImageConext()로 부터 리턴받는 이미지의 사이즈를 재설정한다. 비트맵 이미지의 사이즈는 size에 입력된 가로세로 값과 scale 파라미터의 값을 곱한 값이다.

opaque: 비트맵의 불투명 여부

- true는 완전히 불투명하다는 것을 알고 있으면 알파채널을 무시하고 비트맵 저장소를 최적화 한다.

- false는 부분적으로 투명한 픽셀을 처리하려면 알파 채널이 포함되야한다.

scale: 비트맵에 적용할 스케일 사이즈. 0.0으로 설정하면 디바이스 기본 화면 스케일을 설정한다.


> 보통 다음 단계를 따라 이미지를 생성한다.

```swift
// bitmap context를 생성하고 이를 graphics stack에 넣는다.
UIGrapicsBeginImageContextWithOptions(image.Size, false, image.scale)

let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
image.draw(in: rect) // bitmap context에 이미지를 그린다.

// bitmap context로부터 이미지를 가져온다.
let bitmapContextImage = UIGrapicsGetImageFromCurrentImageContext()

// grapics stack에서 bitmap context를 빼낸다.
UIGrapicsEndImageContext()
```

참고 :
https://soulpark.wordpress.com/tag/uigraphicsbeginimagecontextwithoptions/
https://developer.apple.com/documentation/uikit/1623912-uigraphicsbeginimagecontextwitho
