# variableName

Correct variable names consist only of English letters, digits and underscores and they can't start with a digit.

Check if the given string is a correct variable name.

**Example**

- For `name = "var_1__Int"`, the output should be
  `variableName(name) = true`;
- For `name = "qq-q"`, the output should be
  `variableName(name) = false`;
- For `name = "2w2"`, the output should be
  `variableName(name) = false`.

**설명**

주어지는 문자열 안에 "영어, 숫자, _" 이 셋 중에 하나 이상 포함 되있어야 하고 숫자가 맨 앞에 올 수 없다.

**풀이**

문자열 첫번째 문자가 숫자라면 바로 return false

문자 하나하나를 아스키코드로 변환하여 영어인지 숫자인지 언더바 인지 검사하고 

아스키코드 범위 외 문자라면 return false

```swift
func variableName(name: String) -> Bool {
if name.first!.isNumber {
    return false
} else {
    for char in name {
        if isValidCharacter(character: String(char)) == false {
            return false
         }
    }
}
  
    return true

}

func isValidCharacter(character: String) -> Bool {
    guard let ascii = UnicodeScalar(character)?.value else { return false }
    let number = Int(truncating: ascii as NSNumber)
        
    if 65...90 ~= number || 48...57 ~= number || 95 == number || 97...122 ~= number {
        return true
    }

    return false
}
```

**다른 사람 풀이**

```swift
func variableName(name: String) -> Bool {
    let digits : Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let alpha : Set<Character>  = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "_"]
    
    if !alpha.contains(name.characters[name.startIndex]) { return false }

    for c in name.characters {
        if !alpha.contains(c) {
            if !digits.contains(c) { return false }
        }
    }

    return true
}
```

