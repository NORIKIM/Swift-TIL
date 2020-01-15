# Intro - addBorder

Given a rectangular matrix of characters, add a border of asterisks(`*`) to it.

**Example**

For

```swift
picture = ["abc",
           "ded"]
```

the output should be

```swift
addBorder(picture) = ["*****",
                      "*abc*",
                      "*ded*",
                      "*****"]
```

**설명**

`*`을 원소 앞뒤에 넣고  배열 처음과 마지막에 문자 길이 만큼 넣는다

**풀이**

pictrue 원소에 먼저 문자 앞뒤에 `*`을 넣어주고

문자 길이 만큼 picture 맨 앞뒤에 넣어줄 필요한 길이의 별을 star에 저장하고 

picture 앞뒤에 넣어줌

```swift
func addBorder(picture: [String]) -> [String] {
    var matrix = picture
    var star = ""
    
    for i in 0 ..< matrix.count {
        matrix[i] = "*\(matrix[i])*"
    }
    for i in 0 ..< matrix[0].count {
        star += "*"
    }
    matrix.insert(star, at: 0)
    matrix.append(star)
   
    return matrix
}
```

