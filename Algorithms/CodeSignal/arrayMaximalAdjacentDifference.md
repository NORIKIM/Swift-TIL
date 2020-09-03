# Intro - arrayMaximalAdjacentDifference

Given an array of integers, find the maximal absolute difference between any two of its adjacent elements.

**Example**

For `inputArray = [2, 4, 1, 0]`, the output should be
`arrayMaximalAdjacentDifference(inputArray) = 3`.

**설명**

두 원소의 절대값 차이가 가장 큰값을 리턴해라

**풀이**

차이값을 저장할 빈배열 arr 선언

원소의 차이들을 arr에 저장하는데 차이가 마이너스 값이면 -1을 곱해준 값을 저장

arr 최대값 리턴

```swift
func arrayMaximalAdjacentDifference(inputArray: [Int]) -> Int {
    var arr = [Int]()
    for i in 0 ..< inputArray.count - 1 {
        if inputArray[i] - inputArray[i+1] < 0 {
            arr.append((inputArray[i] - inputArray[i+1]) * -1)
        } else {
            arr.append(inputArray[i] - inputArray[i+1])
        }
        
    }
   
    return arr.max()!
}
```

-1 곱하는 대신 abs 메소드를 사용하여 같은 결과를 받을 수 있다!