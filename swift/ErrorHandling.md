# 오류 처리(예외 처리)

최근 객체지향 언어들은 오류가 발생했을 때 함수나 메소드에서 해당 오류를 return 하는 것이 아니라 throws 처리를 할 수 있게 지원한다. 오류를 반환하는 것과 던지는 것은 다르다. 오류를 반환하려면 함수의 반환 타입과 일치해야 하지만, 오류를 던지는 것은 함수의 반환 타입과 일치하지 않아도 된다.

(오류에 대한 객체를 반환하는 것이 아니라 실행 흐름 중간에 오류 객체를 만들어 다른 실행 흐름으로 옮겨가는 것이기 때문)

```swift
do {
  try <오류를 던질 수 있는 함수>
} catch <오류 타입1> {
  // 오류 타입1에 대한 대응
} catch <오류 타입2> {
  // 오류 타입2에 대한 대응
} catch <오류 타입3> {
  // 오류 타입3에 대한 대응
} ...
```



```swift
import Foundation

enum DateParseError : Error {
    case overSizeString
    case underSizeString
/*잘못된 포맷에 의한 오류를 좀 더 자세히 설명하고자 연관 데이터를 추가할 수 있도록 오류 타입 정의*/
    case incorrectFormat(part : String)
    case incorrectData(part : String)
}

struct Date {
    var year : Int
    var month : Int
    var date : Int
}

func parseDate(param : NSString) throws -> Date {
    //입력된 문자열의 길이가 10이 아닐 경우 분석이 불가능하므로 오류
    guard param.length == 10 else {
        if param.length > 10 {
            throw DateParseError.overSizeString
        } else {
            throw DateParseError.underSizeString
        }
    }
    //반환할 객체 타입 선언
    var dateResult = Date(year: 0, month: 0, date: 0)
    
    //연도 정보 분석
    /*문자열을 앞에서부터 4개까지만 읽어온 후, 이를 정수로 반환한다
			substring(with:)가 원하는 위치에서 자를 수 있게 하는데,이 메소드는 범위
			정보를 처리하는 NSRange를 객체로 받는다
			NSRange(location:length:)는 시작 위치로부터 원하는 길이만큼의 범위 객체를
			만든다*/
    if let year = Int(param.substring(with: NSRange(location: 0,
									length: 4))) {
        dateResult.year = year
    } else {
        //연도 분석 오류
        throw DateParseError.incorrectFormat(part: "year")
    }
    
    //월 정보 분석
    if let month = Int(param.substring(with: NSRange(location: 5,
									 length: 2))) {
        //월에 대한 값은 1~12까지만 가능하므로 그 이외의 범위는 잘못된 값으로 처리.
        guard month > 0 && month < 13 else {
            throw DateParseError.incorrectData(part: "month")
        }
        dateResult.month = month
    } else {
        //월 분석 오류
        throw DateParseError.incorrectFormat(part: "month")
    }
    
    //일 정보 분석
    if let date = Int(param.substring(with: NSRange(location: 8,
									length: 2))) {
        //일에 대한 값은 1~31까지만 가능하므로 그 이외의 범위는 잘못된 값으로 처리.
        guard date > 0 && date < 32 else {
            throw DateParseError.incorrectData(part: "date")
        }
        dateResult.date = date
    } else {
        //일 분석 오류
        throw DateParseError.incorrectFormat(part: "date")
    }
    return dateResult
}
```

- 파운데이션 프레임워크에서 제공하는 타입(NS 접두어가 붙은 객체는 파운데이션 프레임워크!)

    NSString : 것으로 String타입보다 사용할 수 있는 메소드가 다양하다.

    NSRange : 인자값으로 사용하는 문자열 일부분을 잘라낸다.

이렇게 정의된 함수나 메소드를 호출할 때는 다음과 같이 호출할 이름 앞에 try키워드를 붙인다.

```swift
try parseDate(param: "2020-02-28")
```

이 값을 다른변수나 상수에 할당할 때도 try키워드는 항상 함수의 이름 앞에 있어야 한다.

```swift
let date = try parseDate(param: "2020-02-28")
```

하지만 try키워드는 단순히 함수를 호출할 수만 있을 뿐 함수에서 던지는 오류를 잡진 못함. 함수에서 던지는 오류를 잡아서 처리하려면 catch 구문을 사용해야 한다.

```swift
func getPartsDate(date : NSString, type : String) {
    do {
        let date = try parseDate(param: date)
        
        switch type {
        case "year":
            print("\(date.year)년 입니다.")
        case "month":
            print("\(date.month)월 입니다.")
        case "date":
            print("\(date.date)일 입니다.")
        default:
            print("입력값에 해당하는 날짜정보가 없습니다.")
        }
        
    } catch DateParseError.overSizeString {
        print("문자열이 너무 깁니다")
    } catch DateParseError.underSizeString {
        print("문자열이 너무 짧습니다")
    } catch DateParseError.incorrectFormat(let part) {
        print("입력값의 \(part)에 해당하는 형식이 잘못됬습니다")
    } catch DateParseError.incorrectData(let part) {
        print("입력값의 \(part)에 해당하는 값이 잘못 사용되었습니다")
    } catch {
        print("알 수 없는 오류가 발생하였습니다")
    }
}
```

- 결과 확인

    ```swift
    getPartsDate(date:"2015-12-31", type: "year")
    //2015년 입니다.
    getPartsDate(date:"2015-13-31", type: "year")
    //입력값의 month에 해당하는 값이 잘못 사용되었습니다
    ```

오류를 던지도록 설계된 함수나 메소드이지만, 필요에 의해 오류를 던지지 않게 하고 싶을 때는 다음과 같이 try키워드 대신 try!키워드를 사용

```swift
let date = try! parseDate(param : "2015-09-31")
print("\(date)")
//Date(year: 2015, month: 9, date: 31)
```

이 키워드는 강제로 해당구문을 실행하는 것으로, 일반적으로 try를 사용해 함수를 호출하여 오류가 발생하면 실행을 멈추고 오류를 던지지만 try! 키워드를 사용하면 오류를 던지지 않고 함수를 강제실행된다. 하지만, 오류가 발생할 경우 런타임 오류로 이어진다.

- 오류처리 해보기

```swift
enum vending: Error {
    case invalidInput
    case issufficientFunds(moneyNeeded: Int)
    case outofstock
}

class vendingMachine {
    var price: Int = 100
    var count: Int = 5
    var deposited: Int = 0
    
    func receiveMoney(_ money: Int) throws {
        guard money > 0 else {
            throw vending.invalidInput
        }
        
        self.deposited += money
        print("\(money)원 받음")
    }
    
    
    func vend(numberOfItmes numberOfItemsToVend: Int) throws -> String {
        guard numberOfItemsToVend * price <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * price - deposited
            throw vending.issufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        guard count >= numberOfItemsToVend else {
            throw vending.outofstock
        }
        
        let totalPrice = numberOfItemsToVend * price
        
        self.deposited -= totalPrice
        self.count -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}
var machine = vendingMachine()
var result: String?

do {
    try machine.receiveMoney(10)
} catch vending.invalidInput {
    print("입력오류")
} catch vending.issufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족")
}


//초기화 사용자화 하기
struct People {
    var height: Double
    var weight: Double?
    var footSize: Int
    init(height: Double, footSize: Int) {
        self.height = height
        self.footSize = footSize
    }
}
var stark = People(height: 180.0, footSize: 270)

print(stark)
// People(height: 180.0, weight: nil, footSize: 270)stark.weight = 82.9print(stark)
// People(height: 180.0, weight: Optional(82.9), footSize: 270)
```

# 실제 사용해보기

```swift
var vendingMachine = VendingMachine()
vendingMachine.inventory()

struct main {
    static func operate() throws {
        while true {
            let userInput = try input()
            try handleOrder(choice: userInput)
        }
    }
    
    static func input() throws -> userChoice {
        OutputView.currentStatus(vendingMachine.balance()) // 현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
        OutputView.beverageList(vendingMachine)
        OutputView.menu() // 1. 금액추가 2. 음료구매
        let select = InputView().selectMenu() // 메뉴를 선택하도록 입력 받는다.
        return try incorrect(select)
    }
    
    static func handleOrder(choice: userChoice) throws {
        let menu = choice.menu
        let value = choice.value - 1
        let product = vendingMachine.currentBeverageStatus()
        
        switch menu {
            case .insertMoney :
                vendingMachine.insert(money: value + 1)
            case .buyBeverage :
                try checkAvailability(of: vendingMachine, value)
                vendingMachine.sell(beverageNumber: value)
                OutputView.printPurchase(productName: product[value].beverageName, price: product[value].beveragaPrice)
        }
    }
}

func work()  {
    while true {
        do {
            try main.operate()
        } catch let error as InputError{
            OutputView.printError(error)
        }
        catch {
            OutputView.printError(InputError.unexpected)
        }
    }
}
 work()
```

