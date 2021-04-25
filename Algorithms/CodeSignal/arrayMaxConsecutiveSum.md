# arrayMaxConsecutiveSum

Given array of integers, find the maximal possible sum of some of its `k` consecutive elements.

**Example**

For `inputArray = [2, 3, 5, 1, 6]` and `k = 2`, the output should be
`arrayMaxConsecutiveSum(inputArray, k) = 8`.
All possible sums of `2` consecutive elements are:

- `2 + 3 = 5`;
- `3 + 5 = 8`;
- `5 + 1 = 6`;
- `1 + 6 = 7`.
  Thus, the answer is `8`.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- **[**input] array.integer inputArray

  Array of positive integers.

  *Guaranteed constraints:*
  `3 ≤ inputArray.length ≤ 105`,
  `1 ≤ inputArray[i] ≤ 1000`.

- [input] integer k

  An integer (not greater than the length of `inputArray`).

  *Guaranteed constraints:*
  `1 ≤ k ≤ inputArray.length`.

- [output] integer

  The maximal possible sum.

**설명**

주어진 배열의 각 원소들을 순서대로 k개씩 합했을 때 제일 큰 숫자 리턴

**풀이**

예> inputArrary: [1,2,3,4] / k: 3 라면 1+2+3 한번 2+3+4한번을 돌게 된다. 원소 3 뒤로는 3개의 숫자를 합할 수 없기 때문에 원소4개의 배열에서 k가 3일 때는 총 두번을 돌면서 합하게 된다.

공식을 만들어 보면, inputArray.count - k + 1 한 횟수만큼 돌게 된다.

횟수만큼 돌면서 합해진 가장 큰 숫자를 리턴하면 된다.

```swift
func arrayMaxConsecutiveSum(inputArray: [Int], k: Int) -> Int {
    var result = [Int]()
    let arrange = inputArray.count - k + 1
    var start = 0
    var end = k
    var sum = 0

    for _ in 0 ..< arrange {
        for j in start ..< end {
            sum += inputArray[j]
        }
        result.append(sum)
        start += 1
        end += 1
        sum = 0
    }
    return result.max()!

}
```

**다른 사람 풀이**

```swift
func arrayMaxConsecutiveSum(inputArray: [Int], k: Int) -> Int {
    var maximum = 0
    for i in 0..<(inputArray.count - (k - 1)) {
        var sum = 0
        for n in 0..<k {
            sum += inputArray[i + n]
        }
        if sum > maximum {
            maximum = sum
        }
    }
    return maximum
}

```

