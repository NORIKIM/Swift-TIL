# bishop and pawn

Given the positions of a white `bishop` and a black `pawn` on the standard chess board, determine whether the bishop can capture the pawn in one move.

The bishop has no restrictions in distance for each move, but is limited to diagonal movement. Check out the example below to see how it can move:
![img](https://codesignal.s3.amazonaws.com/tasks/bishopAndPawn/img/bishop.jpg?_tm=1581997207350)

**Example**

- For `bishop = "a1"` and `pawn = "c3"`, the output should be
  `bishopAndPawn(bishop, pawn) = true`.

  ![img](https://codesignal.s3.amazonaws.com/tasks/bishopAndPawn/img/ex1.jpg?_tm=1581997207686)

- For `bishop = "h1"` and `pawn = "h3"`, the output should be
  `bishopAndPawn(bishop, pawn) = false`.

  ![img](https://codesignal.s3.amazonaws.com/tasks/bishopAndPawn/img/ex2.jpg?_tm=1581997207976)

**Input/Output**

- [execution time limit] 20 seconds (swift)

- [input] string bishop

  Coordinates of the white bishop in the [chess notation](keyword://chess-notation).

  *Guaranteed constraints:*
  `bishop.length = 2`,
  `'a' ≤ bishop[0] ≤ 'h'`,
  `1 ≤ bishop[1] ≤ 8`.

- [input] string pawn

  Coordinates of the black pawn in the same notation.

  *Guaranteed constraints:*
  `pawn.length = 2`,
  `'a' ≤ pawn[0] ≤ 'h'`,
  `1 ≤ pawn[1] ≤ 8`.

- [output] boolean

  `true` if the bishop can capture the pawn, `false` otherwise.

**설명**

비숍은 항상 대각선으로 움직인다. 이때 폰이 비숍의 위치에 있다면 리턴 true, 아니면 false

**풀이**

비숍의 위치로 부터 4분할 하여 폰의 위치에 해당하는 면에서 비숍이 움직이는 방향에 폰이 있는지 확인한다.

또한 비숍은 직선으로 움직이지 못하므로 폰이 직선 위치에 있다면 무조건 리턴 false

```swift
func bishopAndPawn(bishop: String, pawn: String) -> Bool {
    let b = bishop.map{Int(UnicodeScalar(String($0))!.value)}
    let p = pawn.map{Int(UnicodeScalar(String($0))!.value)}
    let end = Int(abs(Int32(b[0] - p[0])) + 1)
    
    if b[0] == p[0] || b[1] == p[1] {
        return false
    }
    
    for i in 1 ..< end {
        if "\(b[0] - i)\(b[1] - i)" == "\(p[0])\(p[1])" {
            return true
        } else if "\(b[0] - i)\(b[1] + i)" == "\(p[0])\(p[1])" {
            return true
        } else if "\(b[0] + i)\(b[1] - i)" == "\(p[0])\(p[1])" {
            return true
        } else if "\(b[0] + i)\(b[1] + i)" == "\(p[0])\(p[1])" {
            return true
        }
    }
    return false
}
```

**다른 사람 풀이**

```swift
func bishopAndPawn(bishop: String, pawn: String) -> Bool {
    let b = bishop.utf8.map{ Int($0) }
    let p = pawn.utf8.map { Int($0) }
    return abs(b[0] - p[0]) == abs(b[1] - p[1])
}
```

한번에 처리 가능한 수학적 공식이 있을거라 생각했는데 역시 이렇게 깔끔하게 정리가 가능하다.