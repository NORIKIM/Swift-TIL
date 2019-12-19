# Intro - arrayReplace

Given an array of integers, replace all the occurrences of `elemToReplace` with `substitutionElem`.

**Example**

For `inputArray = [1, 2, 1]`, `elemToReplace = 1`, and `substitutionElem = 3`, the output should be
`arrayReplace(inputArray, elemToReplace, substitutionElem) = [3, 2, 3]`.

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] array.integer inputArray**

  *Guaranteed constraints:*
  `0 ≤ inputArray.length ≤ 104`,
  `0 ≤ inputArray[i] ≤ 109`.

- **[input] integer elemToReplace**

  *Guaranteed constraints:*
  `0 ≤ elemToReplace ≤ 109`.

- **[input] integer substitutionElem**

  *Guaranteed constraints:*
  `0 ≤ substitutionElem ≤ 109`.

- **[output] array.integer**

**설명**

inputArray안에 elemToReplace가 있으면 그 자리를 substitutionElem으로 교체

```swift
func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var result = inputArray
    for i in 0 ..< result.count {
        if result[i] == elemToReplace {
            result[i] = substitutionElem
        }
    }
    return result
}
```

