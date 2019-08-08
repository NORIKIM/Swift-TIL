# checkPalindrome

Given the string, check if it is a palindrome.

**Example.**

- For `inputString = "aabaa"`, the output should be
  `checkPalindrome(inputString) = true`;
- For `inputString = "abac"`, the output should be
  `checkPalindrome(inputString) = false`;
- For `inputString = "a"`, the output should be
  `checkPalindrome(inputString) = true`.

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] string inputString**

  A non-empty string consisting of lowercase characters.

  *Guaranteed constraints:*
  `1 ≤ inputString.length ≤ 105`.

- **[output] boolean**

  - `true` if `inputString` is a palindrome, `false`otherwise.

**설명**

파라미터로 들어오는 문자열 "aabaa"라면 뒤에서부터 읽어도 "aabaa"이었을 때 true를 반환 그렇지 않으면 false

**풀이**

처음에는 문자열을 for문으로 돌면서 자리를 바꾸려고 했는데 검색해보니 기본제공되는 메소드인 `reversed()`가 있다는 것을 알게됨!

**코드**

```swift
func checkPalindrome(inputString: String) -> Bool {
   var input = String(inputString.reversed())
   return inputString == input
}
```

