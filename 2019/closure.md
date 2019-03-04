# closure

코드의 블럭: 이름이 붙어있는 함수

일급객체

    {(매개변후) -> 반환타입 in 
    	실행코드
    }

    func backwards(left: String, right: String) -> Bool {
        print("\(left) \(right) 비교중")
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

- 활용예제

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