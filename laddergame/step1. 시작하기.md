# 사다리게임

### STEP 1. 시작하기

**요구사항**

- 간단한 사다리 게임을 구현한다.
- n개의 사람과 m개의 사다리 개수를 입력할 수 있어야 한다.
- 사다리는 랜덤으로 있거나 없을 수도 있다.
- 사다리가 있으면 `-`를 표시하고 없으면 `" "` 빈공백을 표시한다. 양옆에는 `|`로 세로를 표시한다.
- 사다리 상태를 화면에 출력한다. 어느 시점에 출력할 것인지에 대한 제약은 없다.
- 메소드가 너무 많은 일을 하지 않도록 분리하기 위해 노력해 본다.

```swift
// 실행결과
참여할 사람은 몇 명 인가요?
3
최대 사다리 높이는 몇 개인가요?
5
|-| |
| |-|
|-| |
| |-|
|-| |
```

**힌트**

- 랜덤값은 arc4random_uniform() 함수를 활용할 수 있다.
- 2차원 배열을 활용하자.
- 값이 있거나 없다면 Bool 타입을 사용할 수 있다.

<br>

```swift
import Foundation

// 참여인원 입력 받기
func getPeople() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let people = readLine()
    return Int(people!)!
}

// 사다리 높이 입력 받기
func getLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = readLine()
    return Int(ladderHeight!)!
}

// 사다리 만들기 구조체로 만들기...ing
let people = getPeople()
let ladderHeight = getLadderHeight()
let colCount = people + (people - 1)

// 사다리 만들기(2차원 배열)
func makeLadder() -> [[String]] {
    var arrLadder: [[String]] = Array(repeating: Array(repeating: "|", count: colCount), count: ladderHeight)
    
    for raw in 0 ..< arrLadder.count {
        for col in 0 ..< colCount {
            if col % 2 == 1 {
                arrLadder[raw][col] = " "
            }
        }
    }
    return arrLadder
}

// 랜덤번호 추출(추후 만들어진 사다리 배열에 랜덤한 위치에 발판을 추가위한 행,열 랜덤 번호)
// 행
func rawRandom() -> Array<Int> {
    var ladderRowRandom:[Int] = []
    
    for _ in 0 ..< people {
        ladderRowRandom.append(Int(arc4random_uniform(UInt32(ladderHeight))))
    }
    return ladderRowRandom
}

// 열
func colRandom() -> Array<Int> {
    var ladderColRandom:[Int] = []
    var oddRandom = 0
    
    while ladderColRandom.count != people  {
        oddRandom = Int(arc4random_uniform(UInt32(people)) + 1)
        if oddRandom % 2 == 0 {
            oddRandom = Int(arc4random_uniform(UInt32(people)) + 1)
        } else {
            ladderColRandom.append(oddRandom)
        }
    }
    return ladderColRandom
}

// 사다리 발판 만들기(랜덤하게 만든 행,열 숫자로 발판 만들기)
func makeFootBoard() -> [[String]] {
    var madeLadder = makeLadder()
    let raw = rawRandom()
    let col = colRandom()
    
    for i in 0 ..< people {
        madeLadder[raw[i]][col[i]] = "-"
    }
    return madeLadder
}

// 사다리 출력
func printLadder() {
    let resultLadder = makeFootBoard()
    for raw in 0 ..< resultLadder.count {
        for col in 0 ..< resultLadder[raw].count {
            print(resultLadder[raw][col], terminator: "")
        }
        print()
    }
}
printLadder()
```

