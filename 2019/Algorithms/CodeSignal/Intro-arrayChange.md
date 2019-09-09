# Intro - arrayChange

You are given an array of integers. On each move you are allowed to increase exactly one of its element by one. Find the minimal number of moves required to obtain a strictly increasing sequence from the input.

**Example**

For `inputArray = [1, 1, 1]`, the output should be
`arrayChange(inputArray) = 3`.

**설명**

배열 원소의 앞뒤 차이가 무조건 1이상 이어야 하며, 1이상 씩 증가시켰을 때 증가된 값과 기존값의 차이들을 합한 값을 리턴

**풀이**

인풋 배열을 복사하는 arr의 원소를 비교하고

앞의 원소값보다 1크게 하여 

원래 인풋 값을 증가 시킨값에서 뺀 수를 합한다

```swift
func arrayChange(inputArray: [Int]) -> Int {
    var count = 0
    var arr = inputArray
    
    for i in 0 ..< inputArray.count - 1 {
        if arr[i] >= arr[i+1] {
            arr[i+1] = arr[i] + 1
            count += arr[i+1] - inputArray[i+1]
        }
    }
    
    return count
}
```

