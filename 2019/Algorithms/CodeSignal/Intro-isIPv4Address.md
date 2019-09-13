# Intro - isIPv4Address

An IP address is a numerical label assigned to each device (e.g., computer, printer) participating in a computer network that uses the Internet Protocol for communication. There are two versions of the Internet protocol, and thus two versions of addresses. One of them is the IPv4 address.

Given a string, find out if it satisfies the IPv4 address naming rules.

**Example**

- For `inputString = "172.16.254.1"`, the output should be
  `isIPv4Address(inputString) = true`;

- For `inputString = "172.316.254.1"`, the output should be
  `isIPv4Address(inputString) = false`.

  `316` is not in range `[0, 255]`.

- For `inputString = ".254.255.0"`, the output should be
  `isIPv4Address(inputString) = false`.

  There is no first number.

**설명**

입력받는 문자가 IPv4이면 리턴 true

```
// IPv4
IPv4 address is a string with the following structure: a.b.c.d, where a, b, c and d are integers in range [0, 255]. For example, 0.0.0.0, 255.255.255.255 or 252.0.128.32 are correct IPv4 addresses, and 0.0.0.256, -1.1.1.1, 0.0.0.0.0 are incorrect.

a.b is named network part and c.d is named host part.
```

**풀이**

문자열을 배열로 만들고 count가 4개가 아니면 IPv4가 아니다.

배열 원소가 0보다 작거나 255보다 크면 IPv4가 아니다.

```swift
func isIPv4Address(inputString: String) -> Bool {
    let add = inputString.components(separatedBy: ".")

    if add.count != 4 {
        return false
    }

    for num in 0 ... 3 {
        if let x = Int(add[num]) {
            if x < 0 || x > 255 {
                return false
            }
        } else {
            return false
        }
    }
    return true
}
```

**다른 사람 풀이**

```swift
func isIPv4Address(inputString: String) -> Bool {
    let values = inputString.components(separatedBy: ".").map { Int($0) }
    return values.count == 4 && !values.contains { $0 == nil || !(0..<256).contains($0!)                                              }
```

공백까지 배열원소로 만들고 return에 false 조건으로 바로 넣었다..



```swift
func isIPv4Address(inputString: String) -> Bool {
     var components = inputString.components(separatedBy: ".")
 if components.count != 4 { return false }
 return components.filter{!$0.isEmpty && Int($0) != nil && 0...255 ~= Int($0)!}.count == 4
}
```

