# Intro - palindromeRearranging

Given a string, find out if its characters can be rearranged to form a palindrome.

**Example**

For `inputString = "aabb"`, the output should be
`palindromeRearranging(inputString) = true`.

We can rearrange `"aabb"` to make `"abba"`, which is a palindrome.

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] string inputString**

  A string consisting of lowercase English letters.

  *Guaranteed constraints:*
  `1 ≤ inputString.length ≤ 50`.

- **[output] boolean**

  - `true` if the characters of the `inputString` can be rearranged to form a palindrome, `false` otherwise.

**설명**

입력되는 문자열에서 왼쪽에서든 오른쪽에서든 읽었을 때 똑같은 문자가 있으면 true

**풀이**

딕셔너리에 문자열을 분석하여 어떤 알파벳들이 있는지 종류와 개수를 정리하고

딕셔너리의 values 각각 2로 나눈 나머지들의 합이 0 또는 1이면 true

```swift
func palindromeRearranging(inputString: String) -> Bool {
    var arr = inputString.map{String($0)}
    var dic = [String:Int]()
    var count = 0
    
    for i in 0 ..< arr.count {
        if dic[arr[i]] == nil {
            dic.updateValue(1, forKey: arr[i])
        } else {
            dic.updateValue(dic[arr[i]]! + 1, forKey: arr[i])
        }
    }
   
    for num in dic.values {
        count += (num % 2)
    }

    return count == 0 || count == 1
}
```

