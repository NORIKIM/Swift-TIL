# differentSymbolsNaive

Given a string, find the number of different characters in it.

**Example**

For `s = "cabca"`, the output should be
`differentSymbolsNaive(s) = 3`.

There are `3` different characters `a`, `b` and `c`.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] string s

  A string of lowercase English letters.

  *Guaranteed constraints:*
  `3 ≤ s.length ≤ 1000`.

- [output] integer

**설명**

주어지는 문자열에서 서로다른 문자의 수를 리턴하라

**풀이**

Set의 중복 요소를 허용하지 않는 특성을 이용하여 해결

```swift
func differentSymbolsNaive(s:String) -> Int {
  let arr = s.map{$0}
  return Set(arr).count
}
```

