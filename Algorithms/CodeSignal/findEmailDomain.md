# find Email Domain

An email address such as `"John.Smith@example.com"` is made up of a local part (`"John.Smith"`), an `"@"` symbol, then a domain part (`"example.com"`).

The domain name part of an email address may only consist of letters, digits, hyphens and dots. The local part, however, also allows a lot of different special characters. [Here](https://en.wikipedia.org/wiki/Email_address#Examples) you can look at several examples of correct and incorrect email addresses.

Given a valid email address, find its domain part.

**Example**

- For `address = "prettyandsimple@example.com"`, the output should be
  `findEmailDomain(address) = "example.com"`;
- For `address = "fully-qualified-domain@codesignal.com"`, the output should be
  `findEmailDomain(address) = "codesignal.com"`.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] string address

  *Guaranteed constraints:*
  `10 ≤ address.length ≤ 50`.

- [output] string



**설명**

이메일 문자열에서 도메인만 가져와라



**풀이**

문자열에서 "@"의 위치를 찾아서 뒤에오는 문자들을 리턴

```swift
func findEmailDomain(address: String) -> String {
    var atIdx = 0
    if let range = address.range(of: "@", options: .backwards) {
        atIdx = address.distance(from: address.startIndex, to: range.lowerBound)
    }

    let cut = address.index(address.startIndex, offsetBy: atIdx+1)
    return String(address[cut...])
}
```

**다른 사람 풀이**

```swift
func findEmailDomain(address: String) -> String {    
    return address.components(separatedBy: "@").last!
}
```

문자열 사용을 잘하는 사람들 풀이를 보면 항상 배열의 first와 last를 활용 하는 듯 하다. 

문자열을 "@"기준으로 분리하여 마지막 요소만 리턴하면 "@"의 위치가 어디에 있든 항상 올바른 도메인이 추출된다.