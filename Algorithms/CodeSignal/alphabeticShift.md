# alphabeticShift

Given a string, your task is to replace each of its characters by the next one in the English alphabet; i.e. replace `a` with `b`, replace `b` with `c`, etc (`z` would be replaced by `a`).

**Example**

For `inputString = "crazy"`, the output should be `alphabeticShift(inputString) = "dsbaz"`.

**설명**

inputString의 각 문자를 알파벳 순서에 맞게 다음 알파벳으로 바꿔라

**풀이**

문자열의 각 문자들을 인코딩한 값에 1을 더하여 아스키코드에 맞는 문자를 리턴

```swift
func alphabeticShift(inputString: String) -> String {
    var result = ""
    for char in inputString.utf16 {
        if char == 122 {
            result += String(UnicodeScalar(97)!)
        }else {
            result += String(UnicodeScalar(char + 1)!)
        }
    }

    return result
}
```

