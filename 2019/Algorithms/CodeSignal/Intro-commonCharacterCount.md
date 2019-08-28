# Intro - commonCharacterCount

Given two strings, find the number of common characters between them.

**Example**

For `s1 = "aabcc"` and `s2 = "adcaa"`, the output should be
`commonCharacterCount(s1, s2) = 3`.

Strings have `3` common characters - `2` "a"s and `1` "c".

**설명**

s1과 s2의 문자열을 분석하여 똑같은 문자의 개수를 구한다.

**풀이**

s1의 "aabcc"에 a가 2개,  s2의 "adcaa"에도 a가 3개 => count에 2

s1의 "aabcc"에 c가 2개,  s2의 "adcaa"에 c가 한개 => count에 1

총합 2+1 3을 리턴한다.

```swift
func commonCharacterCount(s1: String, s2: String) -> Int {
    var second = s2
    var count = 0
    
    for i in s1 {
        for j in second {
            if i == j {
                if s1.firstIndex(of: i) != nil {
                    count += 1
                    second.remove(at: second.firstIndex(of: j)!)
                    break
                }
            }
        }
    }
    return count
}
```

**다른 사람 풀이**

나의 if i == j 대신 if let을 이용하여 라인 수를 줄임

```swift
func commonCharacterCount(s1: String, s2: String) -> Int {
    var a = 0, x = Array(s1.utf8), y = Array(s2.utf8)
    for i in 0..<x.count {
        if let p = y.index(of:x[i]) {
            a += 1
            y.remove(at:p)
        }
    }
    return a
}
```

