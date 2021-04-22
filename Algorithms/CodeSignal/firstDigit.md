# firstDigit

Find the leftmost digit that occurs in a given string.

**Example**

For inputString = “var_1__Int”, the output should be
firstDigit(inputString) = ‘1’;
For inputString = “q2q-q”, the output should be
firstDigit(inputString) = ‘2’;
For inputString = “0ss”, the output should be
firstDigit(inputString) = ‘0’.

**Input/Output**

[execution time limit] 20 seconds (swift)

[input] string inputString

A string containing at least one digit.

Guaranteed constraints:
3 ≤ inputString.length ≤ 10.

[output] char

**설명**

문자열에 포함된 숫자를 찾아라

**풀이**

```swift
func firstDigit(inputString: String) -> Character {
    let num = inputString.map{$0}.filter{$0.isNumber}
    return Character(extendedGraphemeClusterLiteral: num[0])
}
```

**다른 사람 풀이**

```swift
func firstDigit(inputString: String) -> Character {
    return inputString.filter({Int(String($0)) != nil}).first!
}
```

filter를 이용해서 문자열 각 요소들에서 숫자로 변형 가능한지 체크하여 숫자만 리턴

마지막에 first를 넣어주는 것은 string을 character로 리턴 시켜주기 때문

만약 파리미터 값으로 “zbc_1_2”라면 ‘12’ 리턴