# Intro - matrinxElementsSum

After becoming famous, the CodeBots decided to move into a new building together. Each of the rooms has a different cost, and some of them are free, but there's a rumour that all the free rooms are haunted! Since the CodeBots are quite superstitious, they refuse to stay in any of the free rooms, **or any of the rooms below any of the free rooms**.

Given `matrix`, a rectangular matrix of integers, where each value represents the cost of the room, your task is to return the total sum of all rooms that are suitable for the CodeBots (ie: add up all the values that don't appear below a `0`).

**Example**

- For

  ```
  matrix = [[0, 1, 1, 2], 
            [0, 5, 0, 0], 
            [2, 0, 3, 3]]
  ```

  the output should be
  `matrixElementsSum(matrix) = 9`.

  ![example 1](https://codesignal.s3.amazonaws.com/tasks/matrixElementsSum/img/example1.png?_tm=1551538346086)

  There are several haunted rooms, so we'll disregard them as well as any rooms beneath them. Thus, the answer is `1 + 5 + 1 + 2 = 9`.

- For

  ```
  matrix = [[1, 1, 1, 0], 
            [0, 5, 0, 1], 
            [2, 1, 3, 10]]
  ```

  the output should be
  `matrixElementsSum(matrix) = 9`.

  ![example 2](https://codesignal.s3.amazonaws.com/tasks/matrixElementsSum/img/example2.png?_tm=1551538346405)

  Note that the free room in the final column makes the full column unsuitable for bots (not just the room directly beneath it). Thus, the answer is `1 + 1 + 1 + 5 + 1 = 9`.

**설명**

2차원 배열 원소가 0이면 0자리와 그 밑에 있는 숫자들을 제외한 나머지 숫자의 합을 구해라

**풀이**

처음 들어오는 2차원 배열을 2중 for문으로 돌면서 값이 0이면 그 아래 있는 값을 모두 0으로 바꾼 뒤 다시 2중for문을 돌아 값들을 sum에 넣어 계속 더해준다.

```swift
func matrixElementsSum(matrix: [[Int]]) -> Int {
    var arr = matrix
    var sum = 0
    
    for i in 0 ..< arr.count - 1 {
        for j in 0 ..< arr[i].count {
            if arr[i][j] == 0 {
                arr[i+1][j] = 0
            }
        }
    }
    for i in 0 ..< arr.count {
        for j in 0 ..< arr[i].count {
            sum += arr[i][j]
        }
    }
    return sum
}
```

