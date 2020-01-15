# Intro - minesweeper

In the popular **Minesweeper** game you have a board with some mines and those cells that don't contain a mine have a number in it that indicates the total number of mines in the neighboring cells. Starting off with some arrangement of mines we want to create a **Minesweeper** game setup.

**Example**

For

```
matrix = [[true, false, false],
          [false, true, false],
          [false, false, false]]
```

the output should be

```
minesweeper(matrix) = [[1, 2, 1],
                       [2, 1, 1],
                       [1, 1, 1]]
```

Check out the image below for better understanding:

![img](https://codesignal.s3.amazonaws.com/tasks/minesweeper/img/example.png?_tm=1551538408843)

**Input/Output**

- **[execution time limit] 20 seconds (swift)**

- **[input] array.array.boolean matrix**

  A non-empty rectangular matrix consisting of boolean values - `true` if the corresponding cell contains a mine, `false` otherwise.

  *Guaranteed constraints:*
  `2 ≤ matrix.length ≤ 100`,
  `2 ≤ matrix[0].length ≤ 100`.

**설명**

지뢰찾기 게임!

**풀이**

현재 위치에서 주변의 모든 값을 검사했을 때 true가 있으면 현위치에 1씩 더한다.

현재 위치를 제외한 주변 위치를 가지는 값들을 aroundI와 aroundJ배열에 체크할 범위값을 저장

인풋들어오는 matrix와 범위를 가지는 배열을 돌면서 

올바른 배열 위치인지 검사하고

true가 있으면 minesweeperCnt에 1씩 더한다.

```
i-1,j-1  i-1,j   i-1,j+1
i,j-1   < i,j >    i,j+1
i+1,j-1  i+1,j   i+1,j+1
```

```swift
func minesweeper(matrix: [[Bool]]) -> [[Int]] {
    var minesweeperCnt = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    let aroundI = [-1,-1,-1,0,0,1,1,1]
    let aroundJ = [-1,0,1,-1,1,-1,0,1]
    
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[0].count {
            for a in 0 ..< aroundI.count {
                if i+aroundI[a] > -1 && i+aroundI[a] < matrix.count && j+aroundJ[a] > -1 && j+aroundJ[a] < matrix[0].count {
                    if matrix[i+aroundI[a]][j+aroundJ[a]] == true {
                        minesweeperCnt[i][j] += 1
                    }
                    
                }
            }
        }
    }
    
    return minesweeperCnt
}
```

**참고**

https://github.com/NORIKIM/Swift-TIL/blob/master/2019/Algorithms/DFSBFS.md

