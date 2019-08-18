# Intro-Make Arrary Consecutive 2

Ratiorg got `statues` of *different* sizes as a present from CodeMaster for his birthday, each statue having an non-negative integer size. Since he likes to make things perfect, he wants to arrange them from smallest to largest so that each statue will be bigger than the previous one exactly by `1`. He may need some additional statues to be able to accomplish that. Help him figure out the minimum number of additional statues needed.

**Example**

For `statues = [6, 2, 3, 8]`, the output should be
`makeArrayConsecutive2(statues) = 3`.

Ratiorg needs statues of sizes `4`, `5` and `7`.

**설명**

배열안의 숫자 사이의 차이가 1이 되도록 만들 때 들어가야 할 숫자의 개수

**풀이**

먼저 주어지는 배열을 작은 순서대로 정렬한 후,

for loop를 돌며 앞에 숫자와 뒤에 숫자의 차 - 1한 값들을 개수에 더해주었다.

**코드**

```swift
func makeArrayConsecutive2(statues: [Int]) -> Int {
     let arrangeStatues = statues.sorted()
    var count = 0
    
    for num in 0 ..< arrangeStatues.count - 1 {
        if arrangeStatues[num + 1] - arrangeStatues[num] > 1 {
            count += arrangeStatues[num + 1] - arrangeStatues[num] - 1
        }
    }
    return count
}
```

**+**

다른 사람들의 풀이를 보니 sort한번만 해주면 for문도 if 문도 필요하지 않았다  =>

```swift
func makeArrayConsecutive2(statues: [Int]) -> Int {
  let arrangeStatues = statues.sorted()
  return arrangeStatues.last! - arrangeStatues.first! + 1 - arrangeStatues.count 
}
```

이렇게 수학적으로 풀면 더욱 간단해졌다. 