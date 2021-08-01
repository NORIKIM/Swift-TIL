# Array

**String to Array**

```swift
let string = "abcdefg"
let arr = Array(string)
// arr = ["a","b","c","d","e","f","g"]
```

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

- set 이용 하기

  set은 중복된 요소를 허용 하지 않는다

```swift
func removeDuplicate(str : String) -> Int {
  let arr =  str.map{$0}
  return Set(arr).count
}
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

**forEach**

````swift
let arr = [1,2,3]

arr.forEach{ num in
    print(num)
}
````

```swift
myImages.forEach{ UIImageView in
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
        tap.numberOfTapsRequired = 1
        tap.delegate = self
        view.addGestureRecognizer(tap)
 }
```

**배열 계속 돌기**

```swift
// 프로그래머스 완전 탐색 - 모의고사에서 적용했던 방법
// 크기가 다른 두개의 배열의 값을 비교할 때

let answer = [1,2,3,4,5,6]
let num = [1,2,3,4,5]
// answer를 끝까지 돌면 마지막 6은 num의 첫번째와 비교하도록..

var count = 0
for i in 0 ..< answer.count {
  // i는 answer인덱스 끝까지 돌고
  // idx는 끝까지 돌다가 다시 처음으로 돌아감
  let idx = i % num.count 
  if num[idx] == answer[i] {
    count += 1
  }
}
/*
i     0 1 2 3 4 5  
idx   0 1 2 3 4 0 
count 1 2 3 4 5
*/
```

**배열 원소 일렬로 출력**

print의 디폴트는 줄바꿈이다.

terminator를 이용해 줄바꿈을 하지 않고 이어 붙이겠다는 의미를 명시해준다.

separate는 문자 사이사이에 넣고자 하는 문자를 넣어준다.

아래 코드에서는 "" 이므로 아무것도 넣지 않고 줄바꿈 하지 않고 출력하겠다는 의미이다.

```swift
let arr = [1,2,3,4,5]

for i in arr {
  print(i, separate: "", terminator: " ")
}
//결과 : 1 2 3 4 5
```

