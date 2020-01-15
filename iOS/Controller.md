# NavigationController

popViewController(animated: Bool) : 뷰컨트롤러를 pop하여 이전 화면으로 이동시켜 준다. (animated 를 true 로)

정보의 흐름,깊이를 따라서 뷰의 전환이 이뤄지게 된다. (애플 기본 앱 중 설정이 가장 대표적인 예)

# UIImagePickerController

이미지를 가져올 수 있도록 해준다.

```swift
let imagePicker: UIImagePickerController = {
  let picker = UIImagePickerContoller()
  picker.sourceYype = .photoLibrary //앨범에서 가져온다
  return picker
}
```

