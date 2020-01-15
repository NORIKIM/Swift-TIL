# stringInterpolation

```swift
init(stringInterpolation: DefalutStroingInterpolation)
```

: 문자열을 새롭게 만들어 주는 이니셜라이저

값을 미리 가공해서 넣는 것이 아니라 StringInterpolation을 이요해서 쉽게 값 표시를 변경 할 수 있다.

stringInterpolation은 직접 부를수는 없다. 이 이니셜라이저는 string Interpolation을 사용하는 문자열을 생성할 때 컴파일러에 의해 사용된다. 대신, string Interpolation을 사용하여 백슬래시 앞에 있는 값, 리터럴, 변수 또는 식을 괄호 안에 넣어 새 문자열을 작성한다.

```swift
let price = 2
let number = 3
let message = """
              If one cookie costs \(price) dollars, \
              \(number) cookies cost \(price * number) dollars.
              """
print(message)
// Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
```



출처 : 

https://developer.apple.com/documentation/swift/string/3129035-init

http://minsone.github.io/programming/swift-stringinterpolation