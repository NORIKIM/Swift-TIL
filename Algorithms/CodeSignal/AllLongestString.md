# Intro - All Longest String

Given an array of strings, return another array containing all of its longest strings.

**Example**

For `inputArray = ["aba", "aa", "ad", "vcd", "aba"]`, the output should be
`allLongestStrings(inputArray) = ["aba", "vcd", "aba"]`.

**설명**

인풋 스트링 배열의 원소 중 길이가 가장 긴 원소만 리턴

**풀이**

max()이용하여 길이가 가장 긴 원소를 찾아서 필터링

```swift
func allLongestStrings(inputArray: [String]) -> [String] {
    let max = inputArray.max(by: {$0.count < $1.count})
    let filter = inputArray.filter({$0.count == max!.count})
    return filter
}
```

