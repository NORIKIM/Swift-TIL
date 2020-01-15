# step3. 자판기 기본동작

1. 클래스의 객체를 생성하고 활용하는 부분이 어려웠다.

   vendingMahcine 구조체의 currentBalance변수의 값을 변경하는 부분에서 "Instance member 'currentBalance' cannot be used on type 'VendingMachine'"오류가 발생하였다.

   -> 메서드를 mutating으로 변경

   -> 구조체의 변수는 mutating으로만 값을 수정할 수있다.

2. Mutating 메소드 외부에서 호출하기

   ```swift
   struct VendingMachine {
     var currentBalance = 0
   
     //자판기 금액을 원하는 금액만큼 올리는 메소드
     mutating func balance(money: String) {
         let won = Int(money.dropFirst(2))
         self.currentBalance += won!
     }
   }
   --------------------------------------main v
   var vendingMachine = VendingMachine()
   vendingMachine.balance()
   ```

   VendingMachine구조체의 currentBalance는 값타입의 immutable변수이기 때문에 balance메소드를 mutating으로 만들어 값을 수정할 수 있게 하고, main에서 호출하여 활용하기위해서는 immutable한 VendingMachine구조체를 var로 선언하고 mutable한 balance메소드는 따로 호출해야한다.

3. 잔액에 대한 값이 0원에서 변동될 경우 새롭게 반영하여 출력

   ```swift
   var vendingMachine = VendingMachine()
   while(true) {
     OutputView.currentStatus(vendingMachine.balance()) // 현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
     OutputView().beverageList(vendingMachine.drinks())
     OutputView.menu() // 1. 금액추가 2. 음료구매
     let input = InputView().selectMenu() // 메뉴를 선택하도록 입력 받는다.
   
     if input.first == "1" {
         vendingMachine.insert(money: input)
     }
   }
   ```

   var vendingMachine = VendingMachine()

   : vendingMachine을 생성하는것이므로 while문안에 있으면 계속 새로 생성이 된다. 따라서 이 구문을 while문 밖으로 빼내어 계속 새로 생성되지 않도록 한다!

4. VendingMahcine init이 불필요할 때

   ```swift
   var vending = VendingMahcing()
   //Cannot invoke initializer for type with no arguments
   ---------------------------VendingMachine 변경 전
   private var inventory: [String:Int]
   mutating func list() {
           for product in beverage {
               inventory.updateValue(1, forKey: product.beverageName)
           }
       }
   ---오류해결------------------VendingMachine 변경 후
   private var inventory = [String:Int]()
   init() { inventory = list() }
   mutating func list() -> [String:Int]{
           var beverageList = [String:Int]()
           for product in beverage {
               beverageList.updateValue(1, forKey: product.beverageName)
           }
           return beverageList
       }
   ```

5. 딕셔너리의 원소 개수 와 키,값 접근하기

   음료의 이름, 가격, 개수를 가지도록 저장하는 방법에 대해 고민을 많이 함   -> 딕셔너리와 튜플을 이용하면 한번에 모든 정보를 가져올 수 있다.

   순서가 없는 문제점은 key를 숫자타입으로 두고 value는 튜플로 만들어서 key의 순서대로 항상 출력되도록 만듦

   value는 (음료명,가격,개수)로 하여 사용자가 음료를 구매했을 때 튜플로 접근하여 수정가능하도록 함

   ```swift
   private var currentBeverage = [Int:(String,Int,Int)]()
   
   mutating func inventory() {
           for drinks in 0 ..< beverage.count {
           self.currentBeverage.updateValue((beverage[drinks].beverageName,beverage[drinks].beveragePrice,10), forKey: drinks)
           }
       }
   ```

6. 서브클래스의 메소드 사용하기

   Beverage <- Coffe(  isHot( )  ) <- Kanu, TOP

   : Kanu, TOP가 Coffe의 isHot 메서드를 이용해야함

   생성된 인스턴스 중에 Kanu 와 TOP 커피가 뜨거운지 아닌지를 판단하는 메서드를 만들어야 함

   ```swift
   // 따뜻한 음료만 리턴하는 메소드
       func hotBeverage() -> [String] {
           var hot = [String]()
           for drinks in beverage {
               guard let coffee = drinks as? Coffee else {return [""]}
               if coffee.isHot() == true {
                   hot.append(drinks.beverageName)
               }
           }
           return hot
       }
   ```

   다운캐스팅을 이용하여 beverage 원소 중 Coffee를 상속받는 원소만 받아서 처리 하도록 함

7. 메소드의 기능 분리 시 생각해야 할 점(에러 처리 중 잔액과 재고 확인 메소드를 분리 하던 중..)

   하나의 행위와 목적에 두개의 메소드로 분리 할필요 없다. 예를 들어서 자판기에서 음료 구매 행위 시 고려 사항이 두가지라면 하나는 현재 잔액으로 구매 가능한지, 음료의 재고가 있는지라고 할 때 하나의 메소드로 구현 가능하다. 어짜피 메소드를 호출 할 때는 음료구매 행위가 발생 했을 때 두가지 기능이 분리 되있다면 두가지 모두 호출 해야한다.(불필요한 코드 생성을 하지 않도록!)

   그 두가지 기능 중 단독적인 한가지 기능을 필요로 할때 라면 메소드 분리( = 관리자가 재고의 확인이 필요시 분리 필요)

8. 클래스 테스트 코드 작성 시

   setUp() : 항목이 존재해야하거나 특정 상태(객체 인스턴스 만들기, db초기화, 규칙 작성 등)가 필요한 테스트가 있을 때 사용한다.

   ```swift
   class UnitTestVendingMachine: XCTestCase {
       var vendingMachine: VendingMachine!
       
       override func setUp() {
           vendingMachine = VendingMachine()
       }
   }
   ```

   필요한 클래스를 변수에 초기값없이 옵셔널 !를 넣어 선언해두고, setUp함수를 오버라이드 하여 VendingMachine을 이니셜라이즈 해주어 담아 준다.

-------------------

## 피드백

### main

```swift
var vendingMachine = VendingMachine()
vendingMachine.inventory()

func main() {
    OutputView().currentStatus(vendingMachine.balance()) // 현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
    OutputView().beverageList(vendingMachine)
    OutputView().menu() // 1. 금액추가 2. 음료구매
    let input = InputView().selectMenu() // 메뉴를 선택하도록 입력 받는다.
    
    OutputView().printError(incorrect(input))

    switch input.first {
        case "1": vendingMachine.insert(money: input)
        case "2":
            guard notEnoughBalance(of: vendingMachine, input) == .notError else { return OutputView().printError(notEnoughBalance(of: vendingMachine, input)) }
            guard outOfStock(machine: vendingMachine, input) == .notError else { return OutputView().printError(outOfStock(machine: vendingMachine, input))  }
            vendingMachine.sell(beverage: input)
        default: break
    }
  ///피드백: try - catch를 활용해보세요.
}
while true {
    main()
}
///피드백: 메인을 반복하지 말고 main 내부에서 반복문을 사용하세요.
```



### VendingMachine

```swift
struct VendingMachine {
    private var beverage: [Beverage] {
        return [Strawberry(strawberryContent: 3, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "딸기우유"),
                Chocolate(chocolateContent: 30, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "초코우유"),
                Cola(calorie: 200, brand: Cola.company.cocacola, volume: 400, price: 2000, productName: "코카콜라"),
                Sider(carbonicAcidContent: 30, calorie: 300, brand: "코카콜라", volume: 300, price: 2000, productName: "스프라이트"),
                Kanu(kindOfKanu: "아이스블랜드", ice: true, brand: "맥심", volume: 180, price: 500, productName: "카누 아이스 블랜드"),
                TOP(flavor: "라떼", ice: false, brand: "맥심", volume: 200, price: 1400, productName: "TOP카페라떼")]
    }
    private var currentBalance: Int
    private var currentBeverage = [Int:(String,Int,Int)]()
    private var purchase = [String]()
    
    init(currentBalance: Int = 0) {
        self.currentBalance = currentBalance
    }
    
    // 현재 보유 중인 음료 리턴
    func drinks() -> [Beverage] {
        return self.beverage
    }
    
    // 자판기 금액을 변경해주는 메소드
    mutating func insert(money: String) {
        let won = Int(money.dropFirst(2))!
        self.currentBalance = currentBalance + won
    }
  ///피드백: money가 문자열인 건 어색하네요. 돈을 가장 잘 표현할 단위는 뭘까요?
    
    // 현재 잔액 리턴
    func balance() -> Int {
        return self.currentBalance
    }
    

    /// 음료 내역
    // beverage 배열을 이용해서 [종류개수:(음료명,가격,재고)] 형식의 재고상태를 보여주는 딕셔너리를 만듦
    mutating func inventory() {
        for drinks in 0 ..< beverage.count {
            self.currentBeverage.updateValue((beverage[drinks].beverageName,beverage[drinks].beveragePrice,10), forKey: drinks)
        }
    }
  ///피드백: 이 함수는 return 값이 없어도 되나요?
  
    // 현재 음료 현황 리턴
    func currentBeverageStatus() -> [Int:(String,Int,Int)] {
        return currentBeverage
    }
  ///피드백: 리턴 타입이 복잡한데 의미를 모르겠어요. 이런 경우는 저런 값을 포함하는 객체를 추상화해서 새로 선언하는 게 좋습니다.
    
    
    /// 음료수 구매
    // 구매한 음료 처리
    mutating func sell(beverage: String) {
        let selectBeverageNum = Int(beverage.dropFirst(2))! - 1
        for inner in currentBeverage {
            if inner.key == selectBeverageNum {
                subtract(from: inner.key)
                purchaseList(from: inner.key)
                deduct(money: inner.key)
                OutputView().printPurchase(productName: currentBeverage[inner.key]!.0, price: currentBeverage[inner.key]!.1)
            }
        }
    }
  ///피드백1: 여기 음료값에 대한 것도 문자열이 아니라 음료 메뉴에 대한 값을 다른 타입으로 개선해보세요. 입력한 값을 메뉴 중에 어떤 것과 일치시키는 메뉴 객체가 있다면 어떨까요?
  ///피드백2: 위에 했던 피드백과 이어질 텐데 currentBeverage를 추상화한 객체가 있다면 여기 로직이 훨씬 단순해질 것 같습니다. VendingMachine 에서 직접 OutputView를 호출하면 안됩니다. 값을 가져간 곳에서 출력하도록 개선하세요.
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    private mutating func purchaseList(from productNumber: Int) {
        self.purchase.append(currentBeverage[productNumber]!.0)
    }

    // 재고 마이너스
    private mutating func subtract(from inventory: Int) {
        self.currentBeverage[inventory]!.2 -= 1
    }
    
    // 잔액 마이너스
    private mutating func deduct(money: Int) {
        self.currentBalance = currentBalance - currentBeverage[money]!.1
    }
    
    
    /// 특정 음료 구분
    // 유통기한이 지난 재고만 리턴하는 메소드
    private func notValidDate() -> [String] {
        var pastExpiration = [String]()
        for date in beverage{
            if date.validate() == false {
                pastExpiration.append(date.beverageName)
            }
        }
        return pastExpiration
    }

    // 따뜻한 음료만 리턴하는 메소드
    private func hotBeverage() -> [String] {
        var hot = [String]()
        for drinks in beverage {
            guard let coffee = drinks as? Coffee else {return [""]}
            if coffee.isHot() == true {
                hot.append(drinks.beverageName)
            }
        }
        return hot
    }
  ///피드백: 재고나 음료를 리턴할 때는 `[String]` 대신 `[Beverage]` 형식으로 음료수 객체를 직접 다루는 게 좋습니다.
}
```



### Error

```swift
enum Error: String {
    case incorrect = "❌ 메뉴를 확인해주세요"
    case notEnoughBalance = "❌ 잔액이 부족합니다."
    case outOfStock = "❌ 재고가 부족합니다."
    case notError = ""
    
    func message() -> String {
        return self.rawValue
    }
}

// 올바른 메뉴 선택 확인
func incorrect(_ input: String) -> Error {
    let value = input.first
    guard value == "1" || value == "2" else { return Error.incorrect }
    return .notError
}

// 현재의 잔액으로 선택한 음료의 구매 가능 여부 확인
func notEnoughBalance(of machine: VendingMachine, _ input: String) -> Error {
    let balance = machine.balance()
    let status = machine.currentBeverageStatus()
    let selectBeverage = Int(input.dropFirst(2))! - 1
    for drinks in status {
        if drinks.key == selectBeverage {
            guard balance >= status[drinks.key]!.1 else { return .notEnoughBalance }
        }
    }
    return .notError
}

// 선택한 음료의 구매 가능한 재고의 존재 여부
func outOfStock(machine: VendingMachine, _ input: String) -> Error {
    let status = machine.currentBeverageStatus()
    let selectBeverage = Int(input.dropFirst(2))! - 1
    for drinks in status {
        if drinks.key == selectBeverage {
            guard status[drinks.key]!.2 != 0 else { return .outOfStock }
        }
    }
    return .notError
}
///피드백: 보통 Error 자체를 리턴 타입으로 사용하지는 않습니다 최근에 추가된 Result를 사용하기도 합니다만 이 함수가 성공인지 실패인지 구분할 수 있는 상태가 몇 가지인지 생각해서 리턴 타입을 결정해야 합니다. 단지 하나의 상태라면 Bool 만 리턴하고, 그외 나머지 예외적인 경우를 throws 하는 게 좋습니다. 여기 있는 두 함수는 Error 대신 리턴 타입을 바꿔보세요.
```

-----------------------

## 피드백 수정

1. 배열의 원소를 검색할때 배열[0] vs 배열.first의 차이?

   ```swift
   func incorrect(_ input: String) throws -> userChoice {
       let value = input.split(separator: " ").map { String($0) }
       guard let choice = value.first, //optinal("1")
     let menu = Inventory.Menu(rawValue: choice) else {throw InputError.incorrect }
   }
   ```

---------------------

## main

```swift
import Foundation

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
        OutputView().beverageList(vendingMachine)
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
            OutputView().printError(error)
        }
        catch {
            OutputView().printError(InputError.unexpected)
        }
    }
}
 work()
```



## vendingMahcine

```swift
import Foundation

struct VendingMachine {
    private var beverage: [Beverage] {
        return [Strawberry(strawberryContent: 3, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "딸기우유"),
                Chocolate(chocolateContent: 30, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "초코우유"),
                Cola(calorie: 200, brand: Cola.company.cocacola, volume: 400, price: 2000, productName: "코카콜라"),
                Sider(carbonicAcidContent: 30, calorie: 300, brand: "코카콜라", volume: 300, price: 2000, productName: "스프라이트"),
                Kanu(kindOfKanu: "아이스블랜드", ice: true, brand: "맥심", volume: 180, price: 500, productName: "카누 아이스 블랜드"),
                TOP(flavor: "라떼", ice: false, brand: "맥심", volume: 200, price: 1400, productName: "TOP카페라떼")]
    }
    private var currentBalance: Int
    private var currentBeverage = [Inventory]()
    private var purchase = [String]()
    
    init(currentBalance: Int = 0) {
        self.currentBalance = currentBalance
    }
    
    // 현재 보유 중인 음료 리턴
    func drinks() -> [Beverage] {
        return self.beverage
    }
    
    // 자판기 금액을 변경해주는 메소드
    mutating func insert(money: Int) {
        self.currentBalance = currentBalance + money
    }
    
    // 현재 잔액 리턴
    func balance() -> Int {
        return self.currentBalance
    }
    

    /// 음료 내역
    mutating func inventory() {
        for i in beverage {
            self.currentBeverage.append(Inventory(beverageName: i.beverageName, beveragaPrice: i.beveragePrice, beverageCount: 10))
        }
    }
    // 현재 음료 현황 리턴
    func currentBeverageStatus() -> [Inventory] {
        return currentBeverage
    }
    
    
    /// 음료수 구매
    // 구매한 음료 처리
    mutating func sell(beverageNumber: Int) {
        for inner in 0 ..< currentBeverage.count {
            if beverageNumber == inner {
                subtract(from: inner)
                purchaseList(from: inner)
                deduct(money: inner)
            }
        }
    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    private mutating func purchaseList(from productNumber: Int) {
        self.purchase.append(currentBeverage[productNumber].beverageName)
    }

    // 재고 마이너스
    private mutating func subtract(from inventory: Int) {
        self.currentBeverage[inventory].beverageCount -= 1
    }
    
    // 잔액 마이너스
    private mutating func deduct(money: Int) {
        self.currentBalance = currentBalance - currentBeverage[money].beveragaPrice
    }
    
    
    /// 특정 음료 구분
    // 유통기한이 지난 재고만 리턴하는 메소드
    private func notValidDate() -> [Beverage] {
        return beverage.filter{ $0.validate() == false }
    }

    // 따뜻한 음료만 리턴하는 메소드
    private func hotBeverage() -> [Beverage] {
        let coffee = beverage.filter{
            let drink = $0 as? Coffee
                if drink?.isHot() == true { return true }
            return false
        }
        return coffee
    }
}
```

**private var currentBeverage = [Inventory]()** - Inventory는 음료 객체 인스턴스를 관리하는 객체가 되어야 합니다.

**private func hotBeverage()** - if 구문 내부에 let 바인딩과 isHot() 호출을 모두 판단해도 되지 않았을까요?
혹은 guard let 과 isHot() 호출도 표현할 수 있을 것 같습니다.

이런 바인딩과 비교는 자주 사용하게 될텐데 읽기쉽고, 안전하게 처리하는 것을 늘 먼저 고민하세요.
물론 지금도 잘 동작합니다만, 들여쓰기도 그렇고 어색한 부분이 있습니다.
`return true` 같은 표현을 직접 쓰기 보다 `return drink?.isHot()` 으로 해도 됩니다.

## Inventory

```swift
import Foundation

struct Inventory {
    enum Menu: String {
        case insertMoney = "1"
        case buyBeverage = "2"
    }
    
    var beverageName: String
    var beveragaPrice: Int
    var beverageCount: Int
    
    init(beverageName: String, beveragaPrice: Int, beverageCount: Int) {
        self.beverageName = beverageName
        self.beveragaPrice = beveragaPrice
        self.beverageCount = beverageCount
    }
}

```

**enum Menu** - Menu는 Inventory와 관련 있기 보다는 자판기 자체와 관련 있는게 아닐까요?
돈을 넣는 메뉴가 Inventory 내부에 있는게 어색합니다.

**struct Inventory** - 객체 인스턴스를 만들어서 Inventory를 구성하는 게 좋습니다.
얼마짜리 딸기 우유가 몇 개 있다는 것을 정보로 구성하는 게 아니라,
딸기우유 객체 인스턴스를 배열에 넣어서 몇 개가 있는지 확인하는거죠.
물론 생성할 때는 몇 개를 만들지 받아서 한꺼번에 만들수도 있겠죠.



## Error

```swift
enum InputError: String, Error {
    case incorrect = "❌ 메뉴를 확인해주세요"
    case notEnoughBalance = "❌ 잔액이 부족합니다."
    case outOfStock = "❌ 재고가 부족합니다."
    case unexpected = "❗️예상치 못한 에러가 발생했습니다."
    
    func message() -> String {
        return self.rawValue
    }
}

typealias userChoice = (menu: Inventory.Menu, value: Int)

// 첫 입력 확인
func incorrect(_ input: String) throws -> userChoice {
    let UserInput = input.split(separator: " ").map { String($0) }
    guard let menuNum = UserInput.first, let menu = Inventory.Menu(rawValue: menuNum) else { throw InputError.incorrect }
    guard let inputNum = UserInput.last, let value = Int(inputNum) else { throw InputError.incorrect }
    if Int(menuNum)! > 2 { throw InputError.incorrect }
    return (menu, value)
}

// 두 번째 입력 확인
func checkAvailability(of machine: VendingMachine, _ select: Int) throws {
    let balance = machine.balance()
    let status = machine.currentBeverageStatus()
    
    // 올바른 음료를 선택했는지 확인
    if select >= status.count { throw InputError.incorrect }
    // 현재의 잔액으로 선택한 음료의 구매 가능 여부 확인
    if status[select].beveragaPrice > balance { throw InputError.notEnoughBalance }
    // 선택한 음료의 구매 가능한 재고의 존재 여부
    if status[select].beverageCount == 0 { throw InputError.outOfStock }
}

```



## OutputView

```swift
import Foundation

/// 출력
struct OutputView {
    static func currentStatus(_ money: Int) {
        print("현재 투입한 금액이 \(money)원입니다. 다음과 같은 음료가 있습니다.")
    }
    
    static func menu() {
        print("""
             1. 금액추가
             2. 음료구매
             """)
    }
    
    // 현재 보유 중인 음료수 내역
    func beverageList(_ beverage:VendingMachine) {
        let drinks = beverage.currentBeverageStatus()
        for inner in 0 ..< drinks.count {
            print("\(inner + 1)) \(drinks[inner].beverageName) \(drinks[inner].beveragaPrice)원 \(drinks[inner].beverageCount)개")
        }
    }
    
    // 음료 구매 후 출력문
    static func printPurchase(productName: String, price: Int) {
        print("\(productName)를 구매하셨습니다. \(price)원을 차감합니다.\n")
    }
    
    // 에러 출력
    func printError(_ error: InputError) {
            print(error.message())
    }
}
```

`OutputView().beverageList()` 만 왜 OutputView 인스턴스를 생성하고 있나요?
일관성 있게 사용할 수 있도록 하는게 좋습니다. 이렇게 쓰면 헷갈릴 수 있습니다.

