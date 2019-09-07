# Intro - Are Similar

Two arrays are called *similar* if one can be obtained from another by swapping at most one pair of elements in one of the arrays.

Given two arrays `a` and `b`, check whether they are *similar*.

**Example**

- For `a = [1, 2, 3]` and `b =  ß[1, 2, 3]`, the output should be
  `areSimilar(a, b) = true`.

  The arrays are equal, no need to swap any elements.

- For `a = [1, 2, 3]` and `b = [2, 1, 3]`, the output should be
  `areSimilar(a, b) = true`.

  We can obtain `b` from `a` by swapping `2`and `1` in `b`.

- For `a = [1, 2, 2]` and `b = [2, 1, 1]`, the output should be
  `areSimilar(a, b) = false`.

  Any swap of any two elements either in `a` or in `b` won't make `a` and `b` equal.

**설명**

a배열과 b배열의 원소의 순서가 같으면 true

원소의 순서가 다르더라고 위치를 한번만 변경해서 같으면 true

**풀이**

a와 b 배열의 원소를 검사하여 다른 원소의 인덱스 값을 따로 idx에 저장

idx 개수가 2개 이상이면 다른 원소의 위치를 바꾼다

```swift
func areSimilar(a: [Int], b: [Int]) -> Bool {
    var bArr = b
    var idx = [Int]()

    for i in 0 ..< a.count {
        if a[i] != b[i] {
            idx.append(b.firstIndex(of: b[i])!)
        }
    }

    if idx.count > 2 {
        return false
    } else if idx.count == 0 {
        return true
    } else {
        bArr.swapAt(idx[0], idx[1])
        for i in 0 ..< a.count {
            if a[i] != bArr[i] {
                return false
            }
        }
    }
    
    return true
}
```

***test case 한개 통과 못함***

어떤 case에서 통과 못한건지는 모르겠다....

**다른 사람 풀이**

```swift
var out: [Int] = [], bCopy = b
    for i in 0..<a.count where a[i] != b[i] && out.count < 2 {
        out.append(i)
    }
    if out.count == 2 {
        bCopy.swapAt(out[0], out[1])
    }
    return a == bCopy
```

내 코드보다 훨~씬 간결하다

내가 생각한 방식과 같은데 어떻게 이렇게 짧아질 수 있는지.. ㅠ

firstIndex 조차 필요가 없고 인덱스 넘버를 저장하는 out의 개수가 2일 때만 딱 swap하고 a와 bCopy가 같은지만 바로 리턴...