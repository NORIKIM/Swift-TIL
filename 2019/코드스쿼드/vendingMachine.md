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
   --------------------------------------main
   var vendingMachine = VendingMachine()
   vendingMachine.balance()
   ```

   VendingMachine구조체의 currentBalance는 값타입의 immutable변수이기 때문에 balance메소드를 mutating으로 만들어 값을 수정할 수 있게 하고, main에서 호출하여 활용하기위해서는 immutable한 VendingMachine구조체를 var로 선언하고 mutable한 balance메소드는 따로 호출해야한다.