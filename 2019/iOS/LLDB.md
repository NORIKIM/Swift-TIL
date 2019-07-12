# LLDB

##  - Evaluating Expression

### 변수 선언

```swift
setting set target.language swif // swift 언어로 lldb를 사용할 수 있게 해줌
expression var $foo = 5
expr print($foo) // 5
e $foo += 1
e print($foo) // 6
```

