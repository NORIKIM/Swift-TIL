# Assets

**이미지 적용**

```swift
버튼.setImage(UIImage(named:"이미지세트명"), for: UIControl.State.normal)
이미지 = UIImage(named: "이미지 파일명")
```

**음악파일 적용**

```swift
let sound = NSDfataAsset(name: "곡명")
```

NSDfataAsset은 옵셔널 이므로 gurad로 바인딩 시켜준다

```swift
guard let sound = NSDataAsset(name:"곡명") else {
  print("파일을 가져올 수 없습니다.")
  return
}
```

오디오플레이어에 가져온 음원을 재생할 수 있도록 담아준다.

```swift
var player: AVAudioPlayer!
// ! : 초기화는 함수를 이용할 예정이므로 값이 있음을 알려준다

player = AVAudioPlayer(data: sound.data)
```

AVAudioPlayer(data: Data)는 에러가 발생하면 에러를 throw해줘야 하므로 try-catch문을 사용해준다.

```swift
do {
  try player = AVAudioPlayer(data: sound.data)
  player.delegate = self
} catch let error as NSError {
  print("플레이어 초기화 실패")
  print("코드 : \(error.code), 메세지: \(error.localizedDescription)")
}
```

**앱아이콘**

기존의 AppIcon 은 삭제하고 하단 + 버튼에서 import 
