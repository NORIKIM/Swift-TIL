# Photos

## info.plist

- **Privacy - Photo Library Usage Description**

사용자에게 사진첩의 접근을 허가 받는다. 

허가 알럿을 띄우기 위한 코드를 추가한다.

```swift
   override func viewDidLoad() {
   super.viewDidLoad()
        
    // 사진의 허가를 먼저 확인하고 컬렉션을 불러옴
    let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
    switch photoAurhorizationStatus {
    case .authorized:
        print("접근 허가됨")
    case .denied:
        print("접근 불허")
    case .notDetermined:
        print("아직 응답하지 않음")
        PHPhotoLibrary.requestAuthorization({ (status) in
            switch status {
             case .authorized:
                print("사용자가 허용함")
                    
            case .denied:
                print("사용자가 불허함")
            default: break
            }
        })
    case .restricted:
        print("접근 제한")
    }
}
   ```
