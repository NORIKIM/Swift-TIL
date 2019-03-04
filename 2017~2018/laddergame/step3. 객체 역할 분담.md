# 사다리게임

### STEP 3. 객체 역할 분담

**요구사항**

- 기존 코드를 모두 삭제하고 처음부터 다시 구현을 시작하거나, 이전 단계 메소드 분리 요구사항을 구현한 상태에서 시작한다.
- [구조체 타입 강의 슬라이드](http://public.codesquad.kr/jk/data-struct-slide.pdf) 자료를 학습한다.
- 사다리 게임에 참여하는 사람에 이름을 최대5글자까지 부여할 수 있다. 사다리를 출력할 때 사람 이름도 같이 출력한다.
- 사람 이름은 쉼표(,)를 기준으로 구분한다.
- 사람 이름을 5자 기준으로 출력하기 때문에 사다리 폭도 넓어져야 한다.

<br>

**실행결과**

위 요구사항에 따라 3명의 사람을 위한 5개 높이 사다리를 만들 경우, 프로그램을 실행한 결과는 다음과 같다.

```
참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)
pobi,honux,crong,jk
최대 사다리 높이는 몇 개인가요?
5
  |-----|     |-----|
  |     |-----|-----|
  |-----|     |     |
  |     |-----|-----|
  |-----|     |-----|
pobi  honux crong   jk
```

<br>

**힌트**

- 사람 이름을 쉼표(,)를 기준으로 분리하려면 String 타입에 split(separator: ",") 메소드를 활용한다.
- `let names = inputName.split(separator: ",")`
- 사용자가 입력한 이름의 숫자 만큼 사다리 가로 축을 생성한다.
- 이름 속성을 갖는 참여자 LadderPlayer struct를 작성한다.
- 모든 구조체는 각자 다른 스위프트 파일로 작성한다.
- 사다리 높이 속성과 참여자를 Array로 포함하는 LadderGame struct를 작성한다.

```swift
struct LadderPlayer {
    let name : String
}

struct LadderGame {
    var height = 0
    var names : [LadderPlayer]

    // 로직 구현
}
```

- 사용자의 입력을 받는 구조체(InputView)와 결과를 출력하는 구조체(ResultView)를 분리해서 구현한다.
- main 에서는 앞에서 분리한 타입들을 조합해 기능 구현을 완성한다.

<br>

**변경 전**

```swift
//
//  main.swift
//  LadderGame
//
//  Created by JINA on 2017. 12. 21..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

// 참여인원 입력 받기
func getPlayer() -> Array<String> {
    print("참여할 사람 이름을 입력하세요. (이름은 쉽표(,)로 구분하세요)")
    let player = readLine() ?? ""
    let names = player.split(separator: ",").map(String.init)
    return names
}

func playerCount() -> Int{
    let inputNames = getPlayer()
    let names = inputNames.split(separator: ",")
    let countPlayer = names.count
    
    return countPlayer
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
    case hasFootBoard = "-----"
    case noFootBoard = "     "
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
    let countPlayer = player.count
    let ladderHeight = getLadderHeight()
    makeLadder(countPlayer, ladderHeight)
}
main()



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