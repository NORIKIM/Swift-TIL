# adjacent Elements Product

Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.

**Example.**

For `inputArray = [3, 6, -2, -5, 7, 3]`, the output should be
`adjacentElementsProduct(inputArray) = 21`.

`7` and `3`produce the largest product.

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] array.integer inputArray**

  An array of integers containing at least two elements.

  *Guaranteed constraints:*
  `2 ≤ inputArray.length ≤ 10`,
  `-1000 ≤ inputArray[i] ≤ 1000`.

- **[output] integer**

  - The largest product of adjacent elements.

**설명**

배열의 앞뒤 값을 곱했을 때 가장 큰값을 찾아라

**풀이**

문제자체를 잘못이해해서 시간을 낭비 + 답을 보게됨

알고리즘 보다 영어 공부를 해야겠단 생각이 더 많아짐....

그래서 결론은! 그냥 문제 대로 배열의 원소 앞뒤 값을 곱했을 때 큰 값을 구하면 된다.

**코드**

```swift
func adjacentElementsProduct(inputArray: [Int]) -> Int {
    var maxProduct = inputArray[0] * inputArray[1]
    
    for num in 2 ..< inputArray.count {
        maxProduct = max(maxProduct, inputArray[num - 1] * inputArray[num])
    }
    
    return maxProduct
}
```

