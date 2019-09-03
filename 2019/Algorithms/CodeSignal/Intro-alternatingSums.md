# Intro-alternatingSums

Several people are standing in a row and need to be divided into two teams. The first person goes into *team 1*, the second goes into *team 2*, the third goes into *team 1*again, the fourth into *team 2*, and so on.

You are given an array of positive integers - the weights of the people. Return an array of two integers, where the first element is the total weight of *team 1*, and the second element is the total weight of *team 2* after the division is complete.

**Example**

For `a = [50, 60, 60, 45, 70]`, the output should be
`alternatingSums(a) = [180, 105]`.

**설명**

배열의 인덱스 first원소는 리턴 배열 첫번째, second원소는 리턴할 배열 2번째에 합산된 수가 들어간다

**풀이**

a 배열의 인덱스가 짝수면 리턴할 배열 0번에 합산, 홀수면 리턴할 배열 1번에 합산

```swift
func alternatingSums(a: [Int]) -> [Int] {
    var sum = [0,0]
    
    for i in 0 ..< a.count {
        if i % 2 == 0 {
            sum[0] += a[i]
        } else {
            sum[1] += a[i]
        }
    }
    
    return sum
}
```

**리펙토링 해보기**

```swift
func alternatingSums(a: [Int]) -> [Int] {
    var sum = [0,0]
    
    for i in 0 ..< a.count {
      sum[i%2] += a[i]
    }
    
    return sum
}
```

