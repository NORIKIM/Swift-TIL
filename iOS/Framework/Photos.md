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



## PHFetchOptions

**sort descriptor keys**

| Fetch Method                                                 | Keys                                                         |
| :----------------------------------------------------------- | ------------------------------------------------------------ |
| PHAsset                                                      | `SELF`, [`localIdentifier`](apple-reference-documentation://hsF7XT1nc8), [`creationDate`](apple-reference-documentation://hsHbLWqWE_), [`modificationDate`](apple-reference-documentation://hsNjjXooCJ), [`mediaType`](apple-reference-documentation://hs18L9DajR), [`mediaSubtypes`](apple-reference-documentation://hsgbKs0Ok3), [`duration`](apple-reference-documentation://hsmIJ5BAvQ), [`pixelWidth`](apple-reference-documentation://hsXtGeA_OK), [`pixelHeight`](apple-reference-documentation://hsT3ixewxB), [`isFavorite`](apple-reference-documentation://hsY1NeZvgc) (or `isFavorite`), [`isHidden`](apple-reference-documentation://hsx8f_PWyo) (or `isHidden`), burstIdentifier |
| PHAssetCollection                                            | `SELF`, [`localIdentifier`](apple-reference-documentation://hsF7XT1nc8), [`localizedTitle`](apple-reference-documentation://hsynUKRr8l) (or `title`), [`startDate`](apple-reference-documentation://hssQZzIdR6), [`endDate`](apple-reference-documentation://hsJtksbXTu), estimatedAssetCount |
| PHCollectionList                                             | `SELF`, [`localIdentifier`](apple-reference-documentation://hsF7XT1nc8), [`localizedTitle`](apple-reference-documentation://hsynUKRr8l) (or `title`), [`startDate`](apple-reference-documentation://hsnfD-sJ15), endDate |
| PHCollection (can fetch a mix of `PHCollectionList`and `PHAssetCollection`objects) | `SELF`, [`localIdentifier`](apple-reference-documentation://hsF7XT1nc8), [`localizedTitle`](apple-reference-documentation://hsynUKRr8l) (or `title`), [`startDate`](apple-reference-documentation://hsnfD-sJ15), endDate |

