# extractEachKth

Given array of integers, remove each kth element from it.

**Example**

For inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] and k = 3, the output should be
extractEachKth(inputArray, k) = [1, 2, 4, 5, 7, 8, 10].

**Input/Output**

[execution time limit] 20 seconds (swift)

[input] array.integer inputArray

Guaranteed constraints:
5 ≤ inputArray.length ≤ 15,
-20 ≤ inputArray[i] ≤ 20.

[input] integer k

Guaranteed constraints:
1 ≤ k ≤ 10.

[output] array.integer

inputArray without elements k - 1, 2k - 1, 3k - 1 etc.

**설명**

주어진 배열에서 k의 배수인 원소를 제거하라

**풀이**
간단하게 풀릴거라 생각하고 풀었었는데 히든 테스트 시나리오에서 막혔다.

그래서 내가 이해한게 잘못 된거라 생각했다.

결론적으로는 같은 원리인데... 다시 생각했던 방식은 첫 원소에서 부터 각 k의 배수 전 까지 원소만 남기고 이걸 주어진 배열과 k에 따라 몇회를 도는지? 의 풀이였다

```swift
func extractEachKth(inputArray: [Int], k: Int) -> [Int] {
  var arr = [Int]()
  var start = 0
  var end = k-1
  var count = 0
  let resultCount = ((inputArray.count - 1) % k) == 0 ? k : inputArray.count/2
  
  if k = 1 {
    return []
  } else if k> inputArray.count {
    return inputArray
  } else {
    while count != resultCount {
      for i in start ..< end {
        arr.append(inputArray[i])
      }
      
      start += k
      end += k
      count += 1
    }
    
    if (inputArray.count - 1) % k == 0 {
      arr.append(inputArray[inputArray.count -1])
    }
    
    return arr
}

```

기본 테스트 시나리오에서는 통과했지만 역시나 히든시나리오에서 통과가 안됐다.

결국 정답을 보고 최초에 내가 이해한게 맞았다는걸 깨달았다.


**다른 사람 풀이**

```swift
func extractEahcKth(inputArray: [Int], k: Int) -> [Int] {
    var val = [Int]()
    var j = 1
    
    for i in inputArray.count {
        if j == k {
            j = 1
        } else {
            val.append(inputArray[i)
            j += 1
        }
    }
    
    return val
}
```

하... 내가 똥멍충이구나...