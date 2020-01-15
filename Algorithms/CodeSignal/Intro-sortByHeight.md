# Intro - sort By Height

Some people are standing in a row in a park. There are trees between them which cannot be moved. Your task is to rearrange the people by their heights in a non-descending order without moving the trees. People can be very tall!

**Example**

For `a = [-1, 150, 190, 170, -1, -1, 160, 180]`, the output should be
`sortByHeight(a) = [-1, 150, 160, 170, -1, -1, 180, 190]`.

**설명**

배열 원소가 -1 이면 자리를 고정 시키고 -1이 아닌 원소만 정렬

**풀이**

-1을 제외하고 sorting

처음 들어오는 a 배열의 -1 원소의 인덱스를 따로 저장

sorting한 배열에 -1의 원래 인덱스에 맞춰서 삽입

```swift
func sortByHeight(a: [Int]) -> [Int] {
    var arr = a.filter { (number: Int) -> Bool in return number != -1 }.sorted()
    var idx = [Int]()
    
    for i in 0 ..< a.count {
        if a[i] == -1 {
            idx.append(i)
        }
    }
    for i in idx{
        arr.insert(-1, at: i)
    }
    return arr
}
```

**다른 사람 풀이**

```swift
func sortByHeight(a: [Int]) -> [Int] {
    var sortedA = a.filter {$0 != -1}.sorted {$0 < $1}
    
    for each in 0..<a.count{
        if a[each] == -1{
            sortedA.insert(-1, at: each)
        }
    }
    
    return sortedA
}
```

**적용**

```swift
func sortByHeight(a: [Int]) -> [Int] {
    var arr = a.filter {$0 != -1}.sorted()
    
    for i in 0 ..< a.count {
        if a[i] == -1 {
            arr.insert(-1, at: i)
        }
    }
    
    return arr
}
```

