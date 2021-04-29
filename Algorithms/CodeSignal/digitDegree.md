# digitDegree

Let's define *digit degree* of some positive integer as the number of times we need to replace this number with the sum of its digits until we get to a one digit number.

Given an integer, find its digit degree.

**Example**

- For `n = 5`, the output should be
  `digitDegree(n) = 0`;
- For `n = 100`, the output should be
  `digitDegree(n) = 1`.
  `1 + 0 + 0 = 1`.
- For `n = 91`, the output should be
  `digitDegree(n) = 2`.
  `9 + 1 = 10` -> `1 + 0 = 1`.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] integer n

  *Guaranteed constraints:*
  `5 ≤ n ≤ 109`.

- [output] integer

**설명**

n 각 자리의 숫자 합이 한자리 수가 될 때까지 횟수 리턴

**풀이**

한자리 수는 손댈 필요 없으니 0회

두자리 수 부터 각 자리의 숫자의 합이 한자리 수가 될 때까지 만들어 준다.

```swift
func digitDegree(n: Int) -> Int {
    var sum = 0
    var arr = String(n).map{Int(String($0))}
    var count = 0
    
    if n < 10 {
        return 0
    }
    
    while arr.count != 1 {
        for i in 0 ..< arr.count {
            sum += arr[i]!
        }
        count += 1
        if sum < 10 {
            return count
        } else {
            arr = String(sum).map{Int(String($0))}
            sum = 0
        }
    }
    
    return count
}
```



**다른 사람 풀이**

```swift
func digitDegree(n: Int) -> Int {
    if n < 10 {return 0}
  
    var arr = String(n).characters.map{ return Int(String($0))!}
    var sum = 0
  
    for item in arr {
        sum += item
    }
    return 1 + digitDegree(n: sum)
}
```

재귀를 이용하여 라인 수를 절반으로 줄였다.

리턴할 때 1을 더해줌으로써, 재귀를 돌때마다 1씩 증가하게 된다.