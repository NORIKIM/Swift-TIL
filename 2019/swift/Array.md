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

