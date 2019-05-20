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