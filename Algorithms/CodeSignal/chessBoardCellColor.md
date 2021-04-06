# chessBoardCellColor

Given two cells on the standard chess board, determine whether they have the same color or not.

**Example**

- For cell1 = "A1" and cell2 = "C3", the output should be
  chessBoardCellColor(cell1, cell2) = true.

<img src="https://codesignal.s3.amazonaws.com/tasks/chessBoardCellColor/img/example1.png?_tm=1582002259154">

- For cell1 = "A1" and cell2 = "H3", the output should be
  chessBoardCellColor(cell1, cell2) = false.

![img](https://codesignal.s3.amazonaws.com/tasks/chessBoardCellColor/img/example2.png?_tm=1582002260007)

**Input/Output**

[execution time limit] 20 seconds (swift)

[input] string cell1

Guaranteed constraints:
cell1.length = 2, 'A' ≤ cell1[0] ≤ 'H', 1 ≤ cell1[1] ≤ 8.

[input] string cell2

Guaranteed constraints:
cell2.length = 2, 'A' ≤ cell2[0] ≤ 'H', 1 ≤ cell2[1] ≤ 8.

[output] boolean
true if both cells have the same color, false otherwise.

**설명**

체스판의 두개의 셀이 같은 색의 칸에 있으면 true, 아니면 false

**풀이**

for문으로 각 셀 모두 돌면서 셀의 자리를 확인 할 수도 있지만, 아스키코드를 사용해본다.

각 셀의 자리는 알파벳과 숫자로 이루어 지며, 이 셀을 아스키코드로 전환하면 색이 진한 자리의 수는 짝수이고 그렇지 않은 셀은 홀수가 된다. 따라서, 주어지는 2개의 셀이 모두 짝수인지 아닌지 판단하여 결과를 리턴하면 된다.

```swift
func cellNumber(cell: String) -> Int {
    let column = String(cell.first!)
    let row = Int(String(cell.last!))
    return Int(UnicodeScalar(column)!.value) + row!
}

func chessBoardCellColor(cell1: String, cell2: String) -> Bool {
    let cell1 = cellNumber(cell: cell1) % 2
    let cell2 = cellNumber(cell: cell2) % 2
    
    if cell1 == 0 && cell2 == 0 {
        return true
    } else if cell1 == cell2 {
        return true
    }
    return false
}
```

