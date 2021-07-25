# AVPlayer vs AVAudioPlayer

- `AVPlayer` : 로컬에 저장된 파일뿐만아니라 리모트에 저장된 파일을 스트리밍을 통하여 재생할 때 사용
- `AVAudioPlayer` : 로컬에 저장된 오디오 파일의 재생 기능만을 제공

`AVAudioPlayer`는 관련 Delegate를 제공하지만 `AVPlayer`는 제공하지 않는다.

https://caution-dev.github.io/apple-docs/2019/04/28/AVPlayer.html



## URL로 음원 재생

```swift
import AVFoundation

var player: AVplayer?

guard let url = URL(string: song) else { return }
let playItem = AVPlayerItem(url: url)
player = AVPlayer(playerItem: playItem)
player?.play()
```

