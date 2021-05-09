# buildPalindrome

Given a string, find the shortest possible string which can be achieved by adding characters to the end of initial string to make it a [palindrome](keyword://palindrome).

**Example**

For `st = "abcdc"`, the output should be
`buildPalindrome(st) = "abcdcba"`.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] string st

  A string consisting of lowercase English letters.

  *Guaranteed constraints:*
  `3 ≤ st.length ≤ 10`.

- [output] string



**설명**

문자열을 palindrome으로 만들어라

**풀이**

주어진 문자열을 뒤집었을때 똑같으면 그대로 리턴

똑같지 않으면 같은 부분부터 이어붙여 리턴

예> abba -> abba => abba

​      Ke**bab** -> **bab**ek => ke**bab**ek

```swift
func buildPalindrome(st: String) -> String {
    let reverse = String(st.reversed())
    var idx = 0
    var str = st
    
    if reverse == st {
        return st
    } else {
        for i in 1 ..< st.count {
            let original = st.suffix(i)
            let compare = String(original.reversed())
            
            if original == compare {
                idx = i
            }
        }
        
        str += String(reverse[reverse.index(reverse.startIndex, offsetBy: idx)...])
    }
    
    return str
}
```

**다른 사람 풀이**

```swift
func buildPalindrome(st: String) -> String {
    let sr = String(st.characters.reversed())
    if st == sr {
        return st
    } else {
        return String(st[st.startIndex]) + buildPalindrome(st: String(st.characters.dropFirst())) + String(st[st.startIndex])
    }
}
```

