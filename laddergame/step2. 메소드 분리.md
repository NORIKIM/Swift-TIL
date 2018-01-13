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
