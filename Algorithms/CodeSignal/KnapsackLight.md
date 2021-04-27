# KnapsackLight

You found two items in a treasure chest! The first item weighs `weight1` and is worth `value1`, and the second item weighs `weight2` and is worth `value2`. What is the total maximum value of the items you can take with you, assuming that your max weight capacity is `maxW` and you can't come back for the items later?

**Note** that there are only two items and you can't bring more than one item of each type, i.e. you can't take two first items or two second items.

**Example**

- For `value1 = 10`, `weight1 = 5`, `value2 = 6`, `weight2 = 4`, and `maxW = 8`, the output should be
  `knapsackLight(value1, weight1, value2, weight2, maxW) = 10`.

  You can only carry the first item.

- For `value1 = 10`, `weight1 = 5`, `value2 = 6`, `weight2 = 4`, and `maxW = 9`, the output should be
  `knapsackLight(value1, weight1, value2, weight2, maxW) = 16`.

  You're strong enough to take both of the items with you.

- For `value1 = 5`, `weight1 = 3`, `value2 = 7`, `weight2 = 4`, and `maxW = 6`, the output should be
  `knapsackLight(value1, weight1, value2, weight2, maxW) = 7`.

  You can't take both items, but you can take any of them.

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] integer value1

  *Guaranteed constraints:*
  `2 ≤ value1 ≤ 20`.

- [input] integer weight1

  *Guaranteed constraints:*
  `2 ≤ weight1 ≤ 10`.

- [input] integer value2

  *Guaranteed constraints:*
  `2 ≤ value2 ≤ 20`.

- [input] integer weight2

  *Guaranteed constraints:*
  `2 ≤ weight2 ≤ 10`.

- [input] integer maxW

  *Guaranteed constraints:*
  `1 ≤ maxW ≤ 20`.

- [output] integer

**설명**

두개의 보물이 있고 각 보물은 값어치와 무게가 있다. 그러나 정해진 중량 안에서 한번만 가져갈 수 있다. 이때 가져갈 수 있는 보물의 최대 값어치를 구해라

**다른 사람 풀이**

```swift
func knapsackLight(value1: Int, weight1: Int, value2: Int, weight2: Int, maxW: Int) -> Int {
    if weight1 + weight2 <= maxW {
        return value1+value2
    }
    if maxW < weight1 && maxW < weight2 {
        return 0
    }
    if maxW < weight1 {
        return value2
    }
    if maxW < weight2 {
        return  value1
    }
    if value1 > value2 {
        return value1
    }
    return value2
}
```

1. 두 보물의 무게가 중량보다 작거나 같을 때 -> 두 개 모두 가져간다.
2. 두 보물의 무게가 중량보다 클 때 -> 두 개 모두 가져가지 못 한다.
3. 첫번 째 보물의 무게가 중량보다 클 때 -> 두번 째 보물만 가져간다.
4. 두번 째 보물의 무게가 중량봐 클 때 -> 첫번 째 보물만 가져간다.
5. 첫 번째 보물의 가치가 두번 째 보물의 가치보다 클 때 -> 첫번 째 보물만 가져간다.
6. 이 외 -> 두번 째 보물만 가져간다.

