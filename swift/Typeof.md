# type(of: )

let a = 5
    type(of: a) == Int // true

- 나의 응용

    // 다양한 타입의 자료를 가질 수 있도록 프로토콜 생성
    protocol JsonValue {
        func typeInfo() -> Self
    }
    
    extension JsonValue {
        func isSame<T>(val: T.Type) -> Bool {
            return type(of: self) == val
        }
    }
    
    extension Int: JsonValue {
        func typeInfo() -> Int {
            return self
        }
    }
    
    extension String: JsonValue {
        func typeInfo() -> String {
            return self
        }
    }
    
    extension Bool: JsonValue {
        func typeInfo() -> Bool {
            return self
        }
    }
    
    //-------------------------main----------------------------
    let regex = RegularExpression.makeJsonData(split: splitInput).values
    // [10, "jk", 4, "314", 99, "crong", false]
    
        for i in regex {
            print(i.isSame(val: String.self)) // 원소가 문자열인지 확인
        }
    /*
    false
    true
    false
    true
    false
    true
    false
    */

## 타입비교

```swift
var str = "h"

if type(of: str) is String.Type {
  print("str is String")
} else {
  print("str is not String")
}
```

+

```swift
var str = ["h"]

if str[0] is String {
  print("str[0] is String")
}
```

