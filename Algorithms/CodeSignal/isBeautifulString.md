# isBeautifulString

A string is said to be beautiful if each letter in the **string** appears at most as many times as **the previous letter in the alphabet within the string**; ie: `b` occurs no more times than `a`; `c` occurs no more times than `b`; etc. Note that letter `a` has no previous letter.

Given a string, check whether it is *beautiful*.

Example

- For `inputString = "bbbaacdafe"`, the output should be `isBeautifulString(inputString) = true`.

  This string contains 3 `a`s, 3 `b`s, 1 `c`, 1 `d`, 1 `e`, and 1 `f` (and 0 of every other letter), so since there aren't any letters that appear more frequently than the previous letter, this string qualifies as beautiful.

- For `inputString = "aabbb"`, the output should be `isBeautifulString(inputString) = false`.

  Since there are more `b`s than `a`s, this string is not beautiful.

- For `inputString = "bbc"`, the output should be `isBeautifulString(inputString) = false`.

  Although there are more `b`s than `c`s, this string is not beautiful because there are no `a`s, so therefore there are more `b`s than `a`s.

Input/Output

- **[execution time limit] 20 seconds (swift)**

- **[input] string inputString**

  A string of lowercase English letters.

  *Guaranteed constraints:*
  `3 ≤ inputString.length ≤ 50`.

- **[output] boolean**

  Return `true` if the string is beautiful, `false` otherwise.

**설명**

잘 모르겠음, a가 없으면 무조건 false이고, 알파벳의 갯수가 서로 비례 하지 않아도 false인듯

**다른 사람 풀이**

```swift
func isBeautifulString(inputString: String) -> Bool {
    let chars = "abcdefghijklmnoppqrstuvwxyz"
    var d : Dictionary<Character, Int> = ["a":0, "b":0, "c":0, "d":0, "e":0, "f":0, "g":0, "h":0, "i":0, "j":0, "k":0, "l":0, "m":0, "n":0, "o":0, "p":0, "q":0, "r":0, "s":0, "t":0, "u":0, "v":0, "w":0, "x":0, "y":0, "z":0]
    
    for c in inputString {
        d[c] = d[c]! + 1
    }

    var total = Int.max
    for c in chars {
        if d[c]! <= total {
            total = d[c]!
        }
        else {
            return false
        }
    }
    
    return true
}
```

상위권에 있는 사람들의 코드 중에 이 사람 코드가 가장 깔끔하고 가독성이 좋았다.

처음에 파라미터로 들어오는 스트링을 각 알파벳 갯수대로 딕셔너리에 저장해주고 이 갯수가 a~z까지 갯수가 아름답게 비례하는지 체크한다.