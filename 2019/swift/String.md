# String

## 특정 문자 제거

- 양끝 문자 제거

중간에 있는 문자는 제거 불가능

```swift
var helloStr = "Hello!"
var iosStr = "#iOS"
var swiftStr = "#Swift!"

helloStr.trimmingCharacters(in: ["!"])//Hello
iosStr.trimmingCharacters(in: ["#"])//iOS
swiftStr.trimmingCharacters(in: ["#","!"])//Swift
```

- 중간에 있는 문자 제거

    ```swift
    var str = "Hello~!@@@, Zedd"
    str.components(separatedBy: ["~","!","@",","]).joined()
    //Hello Zedd
    //separatedBy에는 String이 들어갈 수 없다. character만 들어가야함
    ```

    ```swift
    var str = "Hello~!@@@, Swift Zedd"
    str.components(separatedBy: ["~","!","@",",","Swift"])//error!!
    ```

- 특정 문자(character) 제거

    ```swift
    var str = "Hello~!@@@, Zedd"
    str.components(separatedBy: ["~","!","@",","]).joined() //Hello Zedd
    ```

- 끝에 있는 문자 제거

    ```swift
    let a = "123456"
    a.dropLast(1) // "12345"
    ```

- trim 이용하기

trim?

문자열 앞뒤의 공백을 제거한 새로운 문자열을 리턴 해주는 함수. 문자열 중간에 있는 공백은 제거되지 않는다.

```swift
//앞뒤 공백이 제거된 AfterTrim 문자열을 구할 수 있습니다.
let beforeTrim = " a b "
let AfterTrim = beforeTrim.trimmingCharacters(in: 
                                 .whitespacesAndNewlines) // "a b"

/*공백이 제거된 문자열에 isEmpty 함수를 사용하면, 유저로부터 입력받은 값의
공백체크를 하기 좋습니다.*/
let beforeTrim = "  "
let beforeIsEmpty = beforeTrim.isEmpty // false
let beforeLength = NSString(string: beforeTrim).length // 2
let afterTrim = beforeTrim.trimmingCharacters(in: 
                                          .whitespacesAndNewlines)
let afterIsEmpty = afterTrim.isEmpty // true
let afterLength = NSString(string: afterTrim).length // 0

//입력받은 문자열에서 괄호 지우기 -> "x,y"
    func removeParenthesis(_ input: String) -> String {
        var inputs = input
        if inputs.contains("(") && inputs.contains(")") {
            inputs = inputs.replacingOccurrences(of: "(", with: "")
            inputs = inputs.replacingOccurrences(of: ")", with: "")
        }
        return inputs
    }

//입력값에서 숫자만 가져오기
func makeNumericArrayBy(rawInput: String) -> [Int?] {
    let pointElements = rawInput.components(separatedBy:CharacterSet
(charactersIn: "-,")).map { $0.trimmingCharacters(in: CharacterSet
(charactersIn: "()")) }
    let numericElements = pointElements.map {Int($0)}
    return numericElements
}
print(makeNumericArrayBy(rawInput: "(10,10)-(3,3)"))
//[Optional(10), Optional(10), Optional(3), Optional(3)]
```

- 상단 코드 해석하기

    ```swift
    let pointElements = rawInput.components(separatedBy:CharacterSet
    (charactersIn: "-,")).map { $0.trimmingCharacters(in:
    CharacterSet(charactersIn: "()")) }
    //["10", "10", "3", "3"]
    ```

    1. components(separatedBy: CharacterSet) → [String]

        : characterSet을 이용해 string을 나눠서 문자열 배열을 리턴

    2.  map { $0 } : 배열의 0번째

    3.  trimmingCharacters(in set: CharacterSet) → String

        : charactersIn에 주어진 character를 string에서 제거하여 새로운 string 리턴
        
        

- split과 components 차이

```swift
let str = "1 2 "
let strArr = str.split(separator: " ")
// strArr["1","2"]
```

```swift
let str = "1 2 "
let strArr = str.components(separatedBy: " ")
// strArr["1","2",""]
```



< 참고 사이트 >

Zedd 블로그 &

[https://hcn1519.github.io/articles/2017-07/swift_Str](https://hcn1519.github.io/articles/2017-07/swift_Str)

<br>

<br>

**Formatter**

date를 내가 원하는 형태로 리턴 받을 수 있도록 해준다

```swift
let dateFormatter: DateFormatter = {
  let format = DateFormatter()
  format.dateStyle = .medium // 날짜를 보여줄 스타일
  format.timeStyle = .medium // 시간을 보여줄 스타일
  
  // 또는 커스텀 형식 >>
  format.dateFormat = "yyyy/MM/dd hh:mm"
}
```

| Pattern                        | Result (in a particular locale)      |
| :----------------------------- | :----------------------------------- |
| yyyy.MM.dd G 'at' HH:mm:ss zzz | 1996.07.10 AD at 15:08:56 PDT        |
| EEE, MMM d, ''yy               | Wed, July 10, '96                    |
| h:mm a                         | 12:08 PM                             |
| hh 'o''clock' a, zzzz          | 12 o'clock PM, Pacific Daylight Time |
| K:mm a, z                      | 0:00 PM, PST                         |
| yyyyy.MMMM.dd GGG hh:mm aaa    | 01996.July.10 AD 12:08 PM            |

1. 숫자

   ```swift
   String(format:"%02d",문자로 바꿀 변수명)
   ```

   "%02d" : 0 - 앞에 0을 붙여준다 / 2 - 2개의 문자 / d - decimal 숫자로

**문자 쪼개기**

문자사이 공백도 다른문자 없이 붙어있는걸 하나씩 분리하려면 FOR문을 사용해야함

```swift
var num = "123"
var numArr = [String]()

for i in num.indices {
  numArr.append(String(num[i]))
}
```

