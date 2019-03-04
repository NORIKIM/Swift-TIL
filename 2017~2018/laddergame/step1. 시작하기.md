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

**변경 전**

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

<br>

**피드백 받은 내용 & 수정 코드**

1. 함수명, 강제언래핑 수정

```swift
+    print("참여할 사람은 몇 명 인가요?")
+    let people = readLine()
+    return Int(people!)!
+}
```

> 제가 getPeople() 함수 이름으로 유추한 것은 People struct 구조체를 리턴할 것 같습니다.
> 함수 이름에 타입을 넣지 않고 리턴값의 구체적인 의미를 명시하는 방법이 좋습니다.
> 그리고 readLine() 처럼 옵셔널을 리턴하는 경우는 강제로 `!`를 붙여서 unwrapping 하기보다는 nil 일때 처리할 기본값을 주는 방식을 권장합니다. 특히 `Int(people!)!` 구문은 people에 숫자가 아닌 문자가 포함된 경우 항상 프로그램이 멈춰버릴 위험이 있습니다.

```swift
+    print("최대 사다리 높이는 몇 개인가요?")
+    let ladderHeight = readLine()
+    return Int(ladderHeight!)!
+}
```

> getLadderHeight() 에서 LadderHeight는 의미있는 표현이라 좋습니다.
> `Int(ladderHeight!)!` 마찬가지로 위험한 코드를 개선해보세요.

```swift
// 수정코드=========================================================================

// 참여인원 입력 받기
func getPlayer() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let player = readLine()
    return Int(player ?? "") ?? 0
}

// 사다리 높이 입력 받기
func getLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = readLine()
    return Int(ladderHeight ?? "") ?? 0
}
```

<br>

2. 호스트 코드 메인부로 이동

```swift
+// 사다리 만들기 구조체로 만들기...ing
+let people = getPeople()
+let ladderHeight = getLadderHeight()
+let colCount = people + (people - 1)
```

> 선언한 함수들을 사용하는 호스트 코드는 이렇게 중간에 나오지 않고 맨 아래 모아두세요.
> 왜냐하면 이후 단계부터는 함수들 선언부와 호출하는 부분을 별도 파일로 분리할 예정입니다.
> 그리고 이렇게 쓰면 people이나 ladderHeight 변수는 글로벌 변수가 되서 동일한 이름을 사용할 때 실수를 할 수 있습니다.

```swift
// 수정코드=========================================================================

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    
    printLadder(resultLadder)
    
    break
}
// main으로 이동 후 각 함수들의 매개변수에 player와 ladderHeight 전달 시킴
```

<br>

3. 데이터 구조 - 다음 단계에서 수정할 예정!

```swift
+        madeLadder[raw[i]][col[i]] = "-"
+    }
+    return madeLadder
+}
```

> 사다리 발판을 만드는 구조는 여러 가지 방식이 있을 수 있습니다. 아래 질문들을 답변해보세요.
>
> - 사다리 정보를 2차원 배열로 해야한다면, String 이 좋을까, Int 가 좋을까
> - 지금처럼 2차원 배열을 미리 만들고 채워넣을지, 순차적으로 만드는게 좋을까
> - 랜덤값을 어떤 데이터 타입으로 다루는 게 좋을까

<br>

> 1. 사다리 정보를 2차원 배열로 해야한다면, String 이 좋을까, Int 가 좋을까
>    사다리가 출력되었을 때의 형태자체가 string이므로 int타입으로 진행 하는 것보다 코드가 더 효율적이라고 생각했습니다. int타입으로 2차원 배열을 만들게 되면 int에서 string으로 형변환을 해줘야 하고 형변환 시 nil 체크까지 필요하게 될거라 생각했구요..
> 2. 지금처럼 2차원 배열을 미리 만들고 채워넣을지, 순차적으로 만드는게 좋을까
>    2차원배열을 순차적으로 만든다는건 어떤 말씀이신지 잘 이해가 안되요..ㅠㅠ
> 3. 랜덤값을 어떤 데이터 타입으로 다루는 게 좋을까
>    전체적으로 타입 자체를 boolean타입으로 바꾸고 메모리를 더 적게 사용하는 방식으로 바꿔야 좀 더 좋은걸까요?

<br>

> 개발자가 늘 데이터구조를 선택할 때는 메모리구조가 얼마나 영향을 미치는지 고민해서 선택해야 합니다.
> 사다리 발판을 표현하는 데이터는 최소한 필요한 데이터만 갖고 있다가 화면에 표시할 때 `-`로 할지, `---`로 할지, 아니면 iOS 화면에 사다리를 그릴지 View객체가 판단할 수도 있습니다.
> 타입마다 메모리구조는 크기가 다른데, Bool은 1, Int는 8, String은 24+이상을 차지합니다. 최소한의 메모리구조를 선택하는 기준을 항상 고민해보세요.

<br>

4. 함수의 역할과 책임은 하나만

```swift
+            print(resultLadder[raw][col], terminator: "")
+        }
+        print()
+    }
```

> printLadder() 함수가 하나 이상의 역할과 책임을 갖고 있는 것 같습니다.
> makeFootBoard()를 외부에서 호출해서 사다리 2차원 배열을 만들어서 매개변수로 넘겨주는 구조였으면 좀 더 명확할 것 같습니다.

```swift
// 수정코드=========================================================================

// 사다리 출력
func printLadder(_ resultLadder:[[String]]) {
    for raw in 0 ..< resultLadder.count {
        for col in 0 ..< resultLadder[raw].count {
            print(resultLadder[raw][col], terminator: "")
        }
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
// printLadder 함수에서 호출했던 makeFootBoard를 메인부로 가져와 printLadder함수에 매개변수로 전달
    let resultLadder = makeFootBoard(player,ladderHeight)
    
    printLadder(resultLadder)
    
    break
}
```

<br>

**step1완료**

```swift
import Foundation

// 참여인원 입력 받기
func getPlayer() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let player = readLine()
    return Int(player ?? "") ?? 0
}

// 사다리 높이 입력 받기
func getLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = readLine()
    return Int(ladderHeight ?? "") ?? 0
}

// 사다리 만들기(2차원 배열)
func makeLadder(_ player:Int, _ ladderHeight:Int) -> [[String]] {
    let colCount = player + (player - 1)
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
func rawRandom(_ player:Int, _ ladderHeight:Int) -> Array<Int> {
    var ladderRowRandom:[Int] = []
    
    for _ in 0 ..< player {
        ladderRowRandom.append(Int(arc4random_uniform(UInt32(ladderHeight))))
    }
    return ladderRowRandom
}

// 열
func colRandom(_ player:Int) -> Array<Int> {
    var ladderColRandom:[Int] = []
    var oddRandom = 0
    
    while ladderColRandom.count != player  {
        oddRandom = Int(arc4random_uniform(UInt32(player)) + 1)
        if oddRandom % 2 == 0 {
            oddRandom = Int(arc4random_uniform(UInt32(player)) + 1)
        } else {
            ladderColRandom.append(oddRandom)
        }
    }
    return ladderColRandom
}

// 사다리 발판 만들기(랜덤하게 만든 행,열 숫자로 발판 만들기)
func makeFootBoard(_ player:Int, _ ladderHeight:Int) -> [[String]] {
    var madeLadder = makeLadder(player,ladderHeight)
    let raw = rawRandom(player,ladderHeight)
    let col = colRandom(player)
    
    for i in 0 ..< player {
        madeLadder[raw[i]][col[i]] = "-"
    }
    return madeLadder
}

// 사다리 출력
func printLadder(_ resultLadder:[[String]]) {
    for raw in 0 ..< resultLadder.count {
        for col in 0 ..< resultLadder[raw].count {
            print(resultLadder[raw][col], terminator: "")
        }
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    let resultLadder = makeFootBoard(player,ladderHeight)
    
    printLadder(resultLadder)
    
    break
}
```

<br>

**데이터 구조 리펙토링**

```swift
import Foundation

// 참여인원 입력 받기
func getPlayer() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let player = readLine()
    return Int(player ?? "") ?? 0
}

// 사다리 높이 입력 받기
func getLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = readLine()
    return Int(ladderHeight ?? "") ?? 0
}

// 사다리 발판 준비
func preparadeToMakeFootBoard(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
    var arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)

    for raw in 0 ..< ladderHeight {
        for col in 0 ..< player - 1 {
            let random = arc4random_uniform(2)
            if random == 0 {
                arrLadder[raw][col] = !arrLadder[raw][col]
            }
        }
    }
    return arrLadder
}

// 사다리 발판 만들기

// 발판 요소
enum LadderFootBoardElements: String {
    case hasFootBoard = "-"
    case noFootBoard = " "
}

// readyToMakeFootBoard에서 만든 불값2차원배열을 발판 요소들로 대체시키기
func transferBoolToHorizon(booleanElement: Bool) -> String {
    return booleanElement ? LadderFootBoardElements.hasFootBoard.rawValue : LadderFootBoardElements.noFootBoard.rawValue
}

// 사다리 모양 완성시키기
func makeFootBoard(_ player: Int, _ ladderHeight:Int){
    let readyFootBoard = preparadeToMakeFootBoard(player, ladderHeight)
    for raw in 0 ..< ladderHeight {
        print ("|", terminator: "")
        for col in 0 ..< player - 1 {
          let footboard = transferBoolToHorizon(booleanElement: readyFootBoard[raw][col])
            print ("\(footboard)", terminator : "|")
        }
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    makeFootBoard(player, ladderHeight)

    break
}
```

