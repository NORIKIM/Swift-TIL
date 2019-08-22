# Array

**중복제거**

```swift
extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var dict = [Element:Bool]()
        return filter({dict.updateValue(true, forKey: $0) == nil})
    }
}
let arr = [1,3,2,1]
arr.removeDuplicates()
// [1,3,2]
```

**특정 값의 위치 찾기**

```swift
array.firstIndex(of: 찾는 값)
// array 안에 찾는 값이 어디에 있는지 인덱스 넘버를 리턴받는다.
```

