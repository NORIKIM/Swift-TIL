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

**조건에 맞는 모든 값 찾기**

```swift
extension Array where Element: Equatable {
    func all(where predicate: (Element) -> Bool) -> [Element]  {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}

let grades = [8, 9, 10, 1, 2, 5, 3, 4, 8, 8]
let goodGrades = grades.all(where: { $0 > 7 })
print(goodGrades)
// Output: [8, 9, 10, 8, 8]
```

**특정 값이 포함 되어 있는지 확인**

```swift
var a = [1,2,3]
a.contains(2) //true
```

**특정 값의 위치 찾기**

```swift
array.firstIndex(of: 찾는 값)
// array 안에 찾는 값이 어디에 있는지 인덱스 넘버를 리턴받는다.


let names = ["Ford", "Arthur", "Trillian", "Zaphod", "Marvin", "Deep Thought", "Eddie", "Slartibartfast", "Humma Kuvula"]
if let index = names.firstIndex(of: "Marvin") {
    print(index)
} // Output: 4


let grades = [8, 9, 10, 1, 2, 5, 3, 4, 8, 8]
if let index = grades.firstIndex(where: { $0 < 7 }) { print("The first index < 7 = \(index)") }
// The first index < 7 = 3
```

**2차원 배열 만들기**

```swift
var arr = [Int](repeating: 0, count: 3) //[0,0,0]
var arr2 = Array(repeating: 0, count: 3) //[0,0,0]
var arr3 = [String](repeating: "A", count: 3) //["A","A","A"]

var arr4 = [[String]](repeating: Array(repeating: "Zedd",count: 2 ), count: 4)
//[["Zedd", "Zedd"], ["Zedd", "Zedd"], ["Zedd", "Zedd"], ["Zedd", "Zedd"]]
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

**filter**

```swift
var removeMinusOne = [int]()

// for 구문 사용
for i in 0 ..< a.count {
  if a[i] != -1 {
    removeMinusOne.append(a[i])
  }
}

// fitler 사용
removeMinusOne = a.filter { (number: Int) -> Bool in return number != -1 }
```

**배열 특정 위치에 값 삽입**

```swift
배열.insert(값, at: 위치)
```

