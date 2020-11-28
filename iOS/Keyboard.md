# Keyboard

### 텍스트필드 입력 시 키보드로 인해 가려지는 문제

텍스트필드의 위치가 키보드에 걸치게 되면 해당 텍스트필드 내용 입력 시 키보드에 가려 입력에 불편함을 주게 된다.

이럴 때 화면을 키보드 높이만큼 올려주면 입력 창을 가리지 않는다.

이를 위해선 키보드의 동작 파악이 필요하다. notificationCenter를 이용하여 키보드의 알림을 받을 수 있도록 한다. 

 viewWillAppear에서 notification에 observer를 추가하고viewWillDisappear에서 메모리 절약을 위해 notification의 observer를 삭제시켜 준다.

```swift
override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(note:)), name: UIResponder.keyboardWillShowNotification, object: nil)
  NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
}
    
override func viewWillDisappear(_ animated: Bool) {
  super.viewWillDisappear(animated)
  NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillShowNotification, object: nil)
  NotificationCenter.default.removeObserver(self, name:UIResponder.keyboardWillHideNotification, object: nil)
}
```

키보드가 보일 때와 사라질 때 오브젝트 함수를 이용하여 구현해준다.

```swift
 @objc func keyboardWillShow(note: NSNotification) {
   if let keyboardSize = (note.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { // 키보드 사이즈를 가져오고
     if keyboardSize.height == 0.0 || keyboardShown == true { return }
     
     // 키보드가 올라와 있지 않다면 키보드 높이 만큼 화면을 애니메이션과 함께 올려준다.
     UIView.animate(withDuration: 0.33, animations: { () -> Void in
                                                       
       if self.originY == nil { self.originY = self.view.frame.origin.y }
       self.view.frame.origin.y = self.originY! - keyboardSize.height
                }, completion: {_ in
                    self.keyboardShown = true
                })
            }
}

@objc func keyboardWillHide(note: NSNotification) {
  if let _ = (note.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
    if keyboardShown == false { return }
    UIView.animate(withDuration: 0.33, animations: { () -> Void in
      guard let originY = self.originY else { return }
      self.view.frame.origin.y = originY }, completion: {_ in
        self.keyboardShown = false })
     }
}
```



