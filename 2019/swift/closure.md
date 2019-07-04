코드의 블럭: 이름이 붙어있는 함수(이름이 있는 코드의 블럭)

모든 함수는 클로저이다 

단 크로저는 함수일 수있고 아닐 수 있다.

함수: 이름이 있는 클로저

클로저: 이름이 없는 함수

- 클로저 캡처

  : 

```swift
var a = 10
var v = {[a] (n:Int) in print(a+n)}
a = 100
v(5) //15
print(a) //여전히 10
```

- 후행클로저

```swift
let reversed: [string] = names.sorted() { (left:string, rigth:string) -> bool in
return left > rigth
}
```



## 고차함수

: 함수의 인자로 다른 함수를 받는 함수

- map

  컨테이너에 있는 요소들을 새로운 형태로 만들고 싶을 때 사용

  ```swift
  var num = [1,2,3]
  let strNum = num.map{(number: Int) -> String in return "\(number)"}
  ```

- reduce

  컨테이너 내부의 콘텐츠를 하나로 통합

  초깃값: 첫번째 파라미터

  값을 어떻게 사용할거냐: 두번째 파라미터

  ```swift
  var num = [1,2,3]
  let sum = num.reduce(3) { $0 + $1 } // 9
  ```

  

일급객체

```swift
{(매개변후) -> 반환타입 in 
	실행코드
}

func backwards(left: String, right: String) -> Bool {
    print("\\(left) \\(right) 비교중")
    return left > right
}

let names: [String] = ["hana","eric","yagom","kim"]
//let reversed: [String] = names.sorted(by: backwards)

/*
후행클로저 = 괄호안에 넣는 것이??
let reversed: [String] = names.sorted(by: { (left: String, right: String) -> Bool in
    return left > right
})
*/

// 암시적 반환 표현의 사용
let reversed = names.sorted { $0 > $1 } 
// 인자도 없이 ">"만 입력가능(> 자체가 연산자 이기때문)

print(reversed)

/*
 고차함수 : 함수를 파라미터로 받아서 함수를 처리하는 함수
 map : 매개변수의 형태를 동일하게 하고 싶을 떄
       let doubleNum = numbers.map { $0 * 2 }
 
 map : 원소 각각을 변형시킬때
 reduce : 원소 끼리 어떤 연산을 하거나 새롭게 만들 때
 */
```

- 활용예제

  ```swift
    	//클로저 처리 방법 2
    	let name:[String] = {
        print("참여할 사람의 이름을 입력하세요.")
        let input = readLine()?.split(separator: ",").map(String.init)
        return input ?? [""]
    }()
  
     //클로저 처리 방법 1
     let name = { () -> [String] in
     print("참여할 사람의 이름을 입력하세요.")
     let input = readLine()?.split(separator: ",").map(String.init)
     return input ?? [""]
     }
     
  
      //원래 코드
    func getPlayerName() -> Array<String>? {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표로 구분하세요)")
        let player = readLine()
        let playerName = player?.split(separator: ",").map(String.init)
        return playerName
    }
  ```