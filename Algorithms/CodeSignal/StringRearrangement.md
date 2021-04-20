# stringRearrangement

Given an array of equal-length strings, you'd like to know if it's possible to rearrange the order of the elements in such a way that each consecutive pair of strings differ by exactly one character. Return `true` if it's possible, and `false` if not.

Note: You're only rearranging the order of the strings, not the order of the letters within the strings!

**Example**

- For `inputArray = ["aba", "bbb", "bab"]`, the output should be
  `stringsRearrangement(inputArray) = false`.

  There are 6 possible arrangements for these strings:

  - `["aba", "bbb", "bab"]`
  - `["aba", "bab", "bbb"]`
  - `["bbb", "aba", "bab"]`
  - `["bbb", "bab", "aba"]`
  - `["bab", "bbb", "aba"]`
  - `["bab", "aba", "bbb"]`

  None of these satisfy the condition of consecutive strings differing by 1 character, so the answer is `false`.

- For `inputArray = ["ab", "bb", "aa"]`, the output should be
  `stringsRearrangement(inputArray) = true`.

  It's possible to arrange these strings in a way that each consecutive pair of strings differ by 1 character (eg: `"aa", "ab", "bb"` or `"bb", "ab", "aa"`), so return `true`.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] array.string inputArray

  A non-empty array of strings of lowercase letters.

  *Guaranteed constraints:*
  `2 ≤ inputArray.length ≤ 10`,
  `1 ≤ inputArray[i].length ≤ 15`.

- [output] boolean

  Return `true` if the strings can be reordered in such a way that each neighbouring pair of strings differ by exactly one character (`false` otherwise).

**설명**

문제가 이해가 안된다...

 '동일한 길이의 문자열 배열이 주어지면, 각 연속된 문자열 쌍이 정확히 한 문자씩 다른 방식으로 요소의 순서를 재정렬할 수 있는지 여부를 알고자 합니다. 가능하면 true로 반환하고, 그렇지 않으면 false로 반환하십시오. 1자로 다른 연속 문자열이 되야 한다' - 파파고

다른 사람의 코드를 보고 이해해보자

**다른 사람 풀이**

```swift
func stringsRearrangement(inputArray: [String]) -> Bool {
    let a = inputArray.map {$0.unicodeScalars.map{ $0.value }}
    return trying([], a)
}

func differ(_ a1: [UInt32], _ a2: [UInt32]) -> Int {
    var sum = 0
    for i in 0..<a1.count {
        if a1[i] != a2[i] {
            sum += 1
        }
    }
    return sum
}

func trying(_ e: [UInt32], _ a: [[UInt32]]) -> Bool {
    if a.count == 0 {
        return true
    }
    
    for i in 0..<a.count {
        if e.count == 0 || differ(a[i], e) == 1 {
            var temp = a
            let rm = temp.remove(at: i)
            if trying(rm, temp) {
                return true
            }
        }
    }
    return false
}
```

배열 안의 알파벳들을 하나하나 비교 해서 서로 같지 않은 요소들을 삭제하면서 count 0이 될때까지 반복, 0이 안되면 리턴을 false.....

이해가 너무 안된다.. ㅠ 다음에 다시 풀어보자