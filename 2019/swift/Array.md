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

**2차원 배열 원소 접근**

```swift
var a = [ [0,1,1,2], [0,5,0,0], [2,0,3,3] ]

for i in 0..<a.count{
    for j in 0..<a[i].count{
        print(a[i][j])
    }
}
```

**map**

```swift
var arr = [11,12,13,14,15]
arr = arr.map{ elem in
             if elem == 15 { return 1} else { return 0 } }
// [0,0,0,0,1]
```

