# absoluteValuesSumMinimization

Given a sorted array of integers `a`, your task is to determine which element of `a` is *closest* to all other values of `a`. In other words, find the element `x` in `a`, which minimizes the following sum:

```
abs(a[0] - x) + abs(a[1] - x) + ... + abs(a[a.length - 1] - x)
```

(where `abs` denotes the absolute value)

If there are several possible answers, output the *smallest* one.

**Example**

- For `a = [2, 4, 7]`, the output should be `absoluteValuesSumMinimization(a) = 4`.

  - for `x = 2`, the value will be `abs(2 - 2) + abs(4 - 2) + abs(7 - 2) = 7`.
  - for `x = 4`, the value will be `abs(2 - 4) + abs(4 - 4) + abs(7 - 4) = 5`.
  - for `x = 7`, the value will be `abs(2 - 7) + abs(4 - 7) + abs(7 - 7) = 8`.

  The lowest possible value is when `x = 4`, so the answer is `4`.

- For `a = [2, 3]`, the output should be `absoluteValuesSumMinimization(a) = 2`.

  - for `x = 2`, the value will be `abs(2 - 2) + abs(3 - 2) = 1`.
  - for `x = 3`, the value will be `abs(2 - 3) + abs(3 - 3) = 1`.

  Because there is a tie, the smallest `x` between `x = 2` and `x = 3` is the answer.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] array.integer a

  A non-empty array of integers, sorted in ascending order.

  *Guaranteed constraints:*
  `1 ≤ a.length ≤ 1000`,
  `-106 ≤ a[i] ≤ 106`.

- [output] integer

  An integer representing the element from `a` that minimizes the sum of its absolute differences with all other elements.

**설명**

주어지는 숫자배열의 요소들을 'abs(a[0] - x) + abs(a[1] - x) + ... + abs(a[a.length - 1] - x)' 수식을 이용해서 결과 값이 제일 작은 x를 찾는다.

**풀이**

수식을 이용하지 않아도 숫자들의 관계에서 방법을 찾을 수 있을 거라 생각했지만 실패하고.. 결국 수식을 이용하여 해결하였다.

```swift
func absoluteValuesSumMinimization(a: [Int]) -> Int {
    var abss = [Int]()
    var value = [Int]()
    
    for i in a {
        for j in a {
            abss.append(abs(i - j))
        }
        value.append(abss.reduce(0,{$0 + $1}))
        abss.removeAll()
    }
    let result = value.firstIndex(of: value.min()!)!
    return a[result]
}
```

a의 요소 개수 만큼 for문으로 돌면서 abs계산한 값을 abss배열에 저장하고, abss배열의 값들의 합을 또 value배열에 저장한다.

그럼 결국 수식을 이용하여 나온 결과값들이 쭉 저장되게 되고 이 중 가장 작은 값에 해당하는 x를 찾아 리턴하면 된다.

**다른 사람 풀이**

```swift
func absoluteValuesSumMinimization(a: [Int]) -> Int {
    return a[a.count % 2 == 0 ? a.count / 2 - 1 : a.count / 2]
}
```

깔끔하다..... 내가 원래 찾으려던 숫자들의 관계...