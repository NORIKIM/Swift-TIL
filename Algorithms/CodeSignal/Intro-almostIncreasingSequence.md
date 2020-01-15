# Intro-almostIncreasingSequence

Given a sequence of integers as an array, determine whether it is possible to obtain a strictly increasing sequence by removing no more than one element from the array.

*Note:* sequence `a0`, `a1`, ..., `an` is considered to be a strictly increasing if `a0 < a1 < ... < an`. Sequence containing only one element is also considered to be strictly increasing.

**Example**

- For `sequence = [1, 3, 2, 1]`, the output should be
  `almostIncreasingSequence(sequence) = false`.

  There is no one element in this array that can be removed in order to get a strictly increasing sequence.

- For `sequence = [1, 3, 2]`, the output should be
  `almostIncreasingSequence(sequence) = true`.

  You can remove `3` from the array to get the strictly increasing sequence `[1, 2]`. Alternately, you can remove `2`to get the strictly increasing sequence `[1, 3]`.

**설명**

들어오는 배열 내의 원소가 오름차순 되지만 같은 숫자가 있거나 숫자를 하나 이상 삭제해야 오름차순이면 false

예> [3, 6, 5, 8, 10, 20, 15] 배열이면 5와 15가 삭제 되어야 하므로 false

**풀이**

sequence 배열을 돌면서 좌측 원소값이 더 크면 앞에 값을 삭제한 배열 하나, 뒤에값을 삭제한 배열하나 총 두개를 준비한다,

각각 다시 for 문을 돌려서 앞과 뒤 값을 비교하여 리턴되는 값을 다시 저장한다.(불값을 저장하는 각각의 변수 생성)

둘중에 하나라도 true면 최종 리턴 true!!!!!!

```swift
func almostIncreasingSequence(sequence: [Int]) -> Bool {
    var front = sequence
    var back = sequence
    var frontResult = true
    var backResult = true
    
    for i in 0 ..< sequence.count - 1 {
        if sequence[i] >= sequence[i+1] {
            front.remove(at: i)
            back.remove(at: i+1)
            break
        }
    }
    for i in 0 ..< front.count - 1 {
        if front[i] >= front[i+1] {
            frontResult = false
            break
        }
    }
    for i in 0 ..< back.count - 1 {
        if back[i] >= back[i+1] {
            backResult = false
            break
        }
    }

    return frontResult || backResult
}
```

이틀? 삼일? 만에 풀었다... 너무 어려운 문제였다.. ㅠㅠ 앞으로 갈길이 멀다.. ㅠㅠ 

