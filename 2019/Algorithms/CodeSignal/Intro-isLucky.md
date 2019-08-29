# Intro - isLucky

Ticket numbers usually consist of an even number of digits. A ticket number is considered *lucky* if the sum of the first half of the digits is equal to the sum of the second half.

Given a ticket number `n`, determine if it's *lucky* or not.

**Example**

- For `n = 1230`, the output should be
  `isLucky(n) = true`;
- For `n = 239017`, the output should be
  `isLucky(n) = false`.

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] integer n**

  A ticket number represented as a positive integer with an even number of digits.

  *Guaranteed constraints:*
  `10 ≤ n < 106`.

- **[output] boolean**

  - `true` if `n` is a lucky ticket number, `false` otherwise.

**설명**

n의 절반위치의 전반 합과 후반 합이 같으면 true

**풀이**

n을 10으로 나눈 값을 저장하는 초기값이 1인 num

n을 10으로 나눈 나머지를 저장할 int 배열 numArr

num을 계속 10으로 나누면서 나머지가 0이 될때까지 계산을 반복

numArr의 절반의 앞과 뒤 각각 합을 저장 후 비교

```swift
func isLucky(n: Int) -> Bool {
    var num = 1
    var numArr = [Int]()
    
    num = n / 10
    numArr.append(n % 10)
    numArr.append(num % 10)

    while num > 0 {
        num = num / 10
        numArr.append(num % 10)
        num = num / 10
        numArr.append(num % 10)
    }
    
    var first = 0
    var second = 0
   
    for i in 0 ..< (numArr.count - 2) / 2 {
        first += numArr[i]
        second += numArr[numArr.count - 3 - i]
    }

    return first == second
}
```

votes를 많이 받은 상위권 사람들은 모두 처음 입력 받는 숫자를 string 배열로 만들어고 reduce()를 사용하여 계산하였음

```swift
// 1
func isLucky(n: Int) -> Bool {
    let c = String(n).characters.map{Int(String($0))!}
    let c1 = c[0..<c.count / 2]
    let c2 = c[c1.count..<c.count]
    
    return c1.reduce(0, combine: +) == c2.reduce(0, combine: +)
}
```

```swift
// 2
func isLucky(n: Int) -> Bool {
    let value = String(n)
    var firstPart = value.characters.dropFirst(value.characters.count / 2).flatMap { Int(String($0))}
    var secondPart = value.characters.dropLast(value.characters.count / 2).flatMap { Int(String($0))}
    return firstPart.reduce(0, +) == secondPart.reduce(0, +)
}
```

```swift
// 3
func isLucky(n: Int) -> Bool {
    let value = String(n)
    var firstPart = value.characters.dropFirst(value.characters.count / 2).flatMap { Int(String($0))}
    var secondPart = value.characters.dropLast(value.characters.count / 2).flatMap { Int(String($0))}
    return firstPart.reduce(0, +) == secondPart.reduce(0, +)
}
```

**리펙토링**

```swift
func isLucky(n: Int) -> Bool {
    let numArr = String(n).map{Int(String($0))!}
    let first = numArr[0..<numArr.count / 2]
    let second = numArr[first.count..<numArr.count]
    
   return first.reduce(0,+) == second.reduce(0,+)
}

```

Reduce(초기값,combine)

reduce(0,+) : first의 각 원소 combine 결과에 0을 (combine에 적었던 조건인 +) 더한다는 의미

초기값이 1이고 더한 값이 3일 때 reduce결과는 4가 된다.