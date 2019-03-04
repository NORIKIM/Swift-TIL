# 사다리게임

### STEP 2. 메소드 분리

**요구사항**

- 기존 코드를 모두 삭제하고 처음부터 다시 구현을 시작하거나, 이전 단계 사다리게임 요구사항을 구현한 상태에서 시작한다.
- indent(인덴트, 들여쓰기) depth를 2단계에서 1단계로 줄여라.
- depth의 경우 if문을 사용하는 경우 1단계의 depth가 증가한다. if문 안에 while문을 사용한다면 depth가 2단계가 된다.
- else를 사용하지 마라.
- 메소드의 크기가 최대 10라인을 넘지 않도록 구현한다.
- method가 한 가지 일만 하도록 최대한 작게 만들어라.

<br>

**힌트**

- indent(들여쓰기)를 줄이는 가장 좋은 방법은 메소드를 분리하는 것이다.
  - indent가 2이상인 메소드의 경우 메소드를 분리하는 방법을 찾는다.
  - 메소드 라인이 10라인을 넘어가는 경우 메소드를 분리한다.
- else를 사용하지 않는 방법은 if절에서 값을 바로 return하거나 guard 구문으로 곧바로 종료하기 때문에 가능하다.

<br>

**변경 전**

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

// 사다리 발판 준비 - 서브
// false 값을 가지고 있는 배열을 랜덤값에 따라 랜덤하게 false를 true로 바꿈
func randomChange(_ arrLadder:[Bool]) -> [Bool]{
    var ladderArr:[Bool] = arrLadder
    
    for val in 0 ..< ladderArr.count {
        let random = arc4random_uniform(2)
        if random == 0 {
            ladderArr[val] = !ladderArr[val]
        }
    }
    return ladderArr
}

// 사다리 발판 준비 - 메인
func preparadeToMakeFootBoard(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
    var arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)

    for row in 0 ..< ladderHeight {
        arrLadder[row] = randomChange(arrLadder[row])
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

// 사다리 모양 완성시키기 - 서브
func makeWall(_ readyFootBoard:[Bool],_ player: Int) {
    for val in 0 ..< player - 1 {
        let footboard = transferBoolToHorizon(booleanElement: readyFootBoard[val])
        print ("\(footboard)", terminator : "|")
    }
}

// 사다리 모양 완성시키기 - 메인
func makeLadder(_ player: Int, _ ladderHeight:Int) {
    let readyFootBoard = preparadeToMakeFootBoard(player, ladderHeight)
    for row in 0 ..< ladderHeight {
        print ("|", terminator: "")
        makeWall(readyFootBoard[row], player)
        print()
    }
}

// main (실행 부)
while true {
    let player = getPlayer()
    let ladderHeight = getLadderHeight()
    makeLadder(player, ladderHeight)

    break
}

```

<br>

**피드백 받은 내용 & 수정 코드**

1. 비교식 줄이기

   ```swift
   +    for val in 0 ..< ladderArr.count {
   +        let random = arc4random_uniform(2)
   +        if random == 0 {
   +            ladderArr[val] = !ladderArr[val]
   ```

   > 코드를 작성할 때 if 나 switch, while 등 비교식을 안쓰고 표현할 수 있으면 더 좋습니다.
   > 여기서도 `random == 0` 비교식이 참인지 거짓인지 상황에 따라 값이 달라지는 거라면
   > `ladderArr[val] = (random == 0)` 형태로만 써도 될 것 같습니다.

   ```swift
   // 수정코드=========================================================================
   for val in 0 ..< ladderArr.count {
     let random = arc4random_uniform(2)
     ladderArr[val] = (random == 0)
   }
   ```

   <br>

   2. 메소드 분리

   ```swift
   func preparadeToMakeFootBoard(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
       var arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)

       for row in 0 ..< ladderHeight {
           arrLadder[row] = randomChange(arrLadder[row])
       }
       return arrLadder
   }
   ```

   > 함수에서 한 가지 동작만 책임지는 역할을 갖고 있다면,
   > preparadeToMakeFootBoard() 에서 미리 2차원 배열을 만들고
   > 다른 함수에서 for 반목하면서 randomeChange를 호출해서 사다리를 채워넣는게 어떨까요? 문단이 나뉘거나 들여쓰기가 생기면 메소드를 분리해봐야 하는지 고민해보세요.

   ```swift
   // 사다리 발판 준비 - 메인
   // bool값 2차원 배열 만들기
   func makeLadderFrame(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
       let arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)
       return arrLadder
   }
   // 불값으로 만든 2차원 배열로 사다리 준비
   func preparadeToMakeFootBoard(_ player: Int, _ ladderHeight: Int) -> [[Bool]] {
       var arrLadder = makeLadderFrame(player,ladderHeight)

       for row in 0 ..< ladderHeight {
           arrLadder[row] = randomChange(arrLadder[row])
       }
       return arrLadder
   }
   ```

   <br>

   3. 함수명 변경

   ```swift
   +// readyToMakeFootBoard에서 만든 불값2차원배열을 발판 요소들로 대체시키기
    +func transferBoolToHorizon(booleanElement: Bool) -> String {
    +    return booleanElement ? LadderFootBoardElements.hasFootBoard.rawValue : LadderFootBoardElements.noFootBoard.rawValue
    +}
   ```

   > 동작 자체는 의미 부여를 잘 했습니다.
   > `transferBoolToHorizon(booleanElement: Bool)` 처럼 함수명이나 매개변수에 타입 정보를 명시하기 보다는 코드에서 어떤 의미를 갖는지 어떤 역할을 갖는지 쓰는게 좋습니다. 타입보다는 구체적인 역할을 의미하는 단어를 찾아보세요. 이름 정하는게 어려운 점 중에 하나에요!

   ```swift
   transferBoolToHorizon -> exchangeWithHorizon
   ```

   <br>

   4. main을 함수로

   ```swift
   // main (실행 부)
   while true {
       let player = getPlayer()
       let ladderHeight = getLadderHeight()
       makeLadder(player, ladderHeight)

       break
   }
   ```

   > while true --- break 이렇게 한 번만 실행되도록 break를 넣을꺼면 굳이 while을 쓸 필요가 없습니다.
   > 차라리 main() 함수를 만들어서 처리해보는 것도 방법입니다.

   ```swift
   // main (실행 부)
   func main() {
       let player = getPlayer()
       let ladderHeight = getLadderHeight()
       makeLadder(player, ladderHeight)
   }
   main()
   ```

   <br>

   **step2. 완료**

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

   // 사다리 발판 준비 - 서브
   // false 값을 가지고 있는 배열을 랜덤값에 따라 랜덤하게 false를 true로 바꿈
   func randomChange(_ arrLadder:[Bool]) -> [Bool]{
       var ladderArr:[Bool] = arrLadder
       
       for val in 0 ..< ladderArr.count {
           let random = arc4random_uniform(2)
           ladderArr[val] = (random == 0)
       }
       return ladderArr
   }

   // 사다리 발판 준비 - 메인
   // bool값 2차원 배열 만들기
   func makeLadderFrame(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
       let arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)
       return arrLadder
   }
   // 불값으로 만든 2차원 배열로 사다리 준비
   func preparadeToMakeFootBoard(_ player: Int, _ ladderHeight: Int) -> [[Bool]] {
       var arrLadder = makeLadderFrame(player,ladderHeight)

       for row in 0 ..< ladderHeight {
           arrLadder[row] = randomChange(arrLadder[row])
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
   func exchangeWithHorizon(booleanElement: Bool) -> String {
       return booleanElement ? LadderFootBoardElements.hasFootBoard.rawValue : LadderFootBoardElements.noFootBoard.rawValue
   }

   // 사다리 모양 완성시키기 - 서브
   func makeWall(_ readyFootBoard:[Bool],_ player: Int) {
       for val in 0 ..< player - 1 {
           let footboard = exchangeWithHorizon(booleanElement: readyFootBoard[val])
           print ("\(footboard)", terminator : "|")
       }
   }

   // 사다리 모양 완성시키기 - 메인
   func makeLadder(_ player: Int, _ ladderHeight:Int) {
       let readyFootBoard = preparadeToMakeFootBoard(player, ladderHeight)
       for row in 0 ..< ladderHeight  {
           print ("|", terminator: "")
           makeWall(readyFootBoard[row], player)
           print()
       }
   }

   // main (실행 부)
   func main() {
       let player = getPlayer()
       let ladderHeight = getLadderHeight()
       makeLadder(player, ladderHeight)
   }
   main()
   ```

   ​

   ​