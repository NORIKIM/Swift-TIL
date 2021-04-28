# longestDigitsPrefix

Given a string, output its longest prefix which contains only digits.

**Example**

For inputString = “123aa1”, the output should be
longestDigitsPrefix(inputString) = “123”.

**Input/Output**

[execution time limit] 20 seconds (swift)

[input] string inputString

Guaranteed constraints:
3 ≤ inputString.length ≤ 100.

[output] string

**설명**

주어지는 문자열에서 숫자만 리턴해라

**풀이**

이 문제는 좀 너무한 문제였다.
예제와 문자열길이만 조건 하나씩만 알려줘 놓고선 막상 풀고나면 테스트 시나리오에서 다 틀리다고 나온다.

그래서 확인하는 테스트 시나리오들을 다 확인하였다.

이 문제에서 걸고 있는 리턴 조건

1. 주어진 문자열에 공란이 있으면 리턴 “”
2. 주어진 문자열에 숫자가 포함되어 있지 않으면 리턴 “”
3. 주어진 문자열에 숫자만 있으면 문자열 그대로 리턴
4. 주어진 문자열에 숫자와 문자가 골고루 있다면 문자열에서 제일 먼저 등장하는 숫자만 리턴

```swift
func longestDigitsPrefix(inputString: String) -> String {
let str = inputString.filter{$0.isLetter}
let num = inputString.filter{$0.isNumber}
let arr = inputString.map{$0}
var temp = “”

if inputString.contains(“ ”) || num.count == 0 {
    return “”
} else if str.count == 0 {
    return num
} else {
    for i in 0 ..< arr.count {
        if arr[i].isNumber {
            temp += String(arr[i])
        } else {
            break
        }
    }
    
    return temp
}
```

**다른 사람 풀이**

```swift
func longestDigitsPrefix(inputString: String) -> String {
    return inputString.components(separatedBy: CharacterSet.dicimalDigits.inverted).first ?? “”
}
```

```swift
func longestDigitsPrefix(inputString: String) -> String {
    var prefix = “”
    
    for item in inputString.characters {
        if let num = Int(String(item)) {
            prefix.append(String(num))
        } else {
            return prefix
        }
    }
    
    return prefix
} 
```
