# Intro-reverseInParentheses

Write a function that reverses characters in (possibly nested) parentheses in the input string.

Input strings will always be well-formed with matching `()`s.

**Example**

- For `inputString = "(bar)"`, the output should be
  `reverseInParentheses(inputString) = "rab"`;
- For `inputString = "foo(bar)baz"`, the output should be
  `reverseInParentheses(inputString) = "foorabbaz"`;
- For `inputString = "foo(bar)baz(blim)"`, the output should be
  `reverseInParentheses(inputString) = "foorabbazmilb"`;
- For `inputString = "foo(bar(baz))blim"`, the output should be
  `reverseInParentheses(inputString) = "foobazrabblim"`.
  Because `"foo(bar(baz))blim"` becomes `"foo(barzab)blim"` and then `"foobazrabblim"`.

**설명**

처음 들어오는 인풋 스트링에 괄호가 포함 되있으면 괄호안의 문자열을 괄호를 제거하고 거꾸로 만들어 줘라

**풀이**

혼자 풀지 못하고 답을 보고 분석 이해함

<br>

inputString을 문자열 배열로 만들고 

이 배열을 for 문으로 돌면서 괄호인지 아닌지 구분

괄호가 아니면 빈 배열인 b[b.count - 1]에 해당 원소를 더해준다

여는 괄호면 b배열에 빈 문자열을 append

닫는 괄호면 (로직 상 괄호안의 문자는 b[1]에 저장된다.) b[1]의 문자를 x에 저장하고 거꾸로 만들어서 b[0]에 더해준다

b배열의 first원소를 리턴

```swift
func reverseInParentheses(inputString: String) -> String {
    var b = [""], i = 0,S = inputString.map{"\($0)"}
    while i < S.count {
        if S[i] == "(" {
            b.append("")
        }else if S[i] == ")" {
            let x = b[b.count - 1]
            print(b.removeLast())
            
            b[b.count - 1] += x.reversed()
        }else{
            b[b.count - 1] += S[i]
        }
        i += 1
    }
    return b.first!
}
```
 