# vendingMachineAPP step1. 아이패드 앱

기존의 자판기 로직을 MVC로 분리

viewController 클래스에 음료 객체를 생성하여 내역을 콘솔에 출력

**beverage.coffee**

```swift
class Coffee: Beverage {
    private let ice: Bool
    
    init(ice: Bool, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.ice = ice
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 18144000, since: dateOfManufacture))
    }
    
    func isHot() -> Bool {
        return ice == false
    }
}
```

이전 단계에서 얘기했었지만, 이런 상태를 나타내는 값은 단순히 뜨겁냐 차갑냐로 bool 타입보다는
온도를 저장할 수 있는 타입을 지정하고, 기준값보다 낮은지 혹은 큰지 비교해서 bool 타입으로 리턴하는 게 좋습니다.



**beverage.milk**

```swift
enum MilkGrade {
    case A
    case B
    case C
}

class Milk: Beverage {
    private let grade: MilkGrade
    
    init(grade: MilkGrade, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.grade = grade
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 432000, since: dateOfManufacture))
    }
    
    func isGradeA() -> Bool {
        return grade == MilkGrade.A
    }
}
```

MilkGrade 처럼 Milk과 관련이 있는 타입은 nested 하게 Milk 아래 선언해도 좋습니다.
Milk.Grade 가 될 수 있는거죠.

**ViewConroller**

```swift
class ViewController: UIViewController {
    var inven = Inventory()

    override func viewDidLoad() {
        super.viewDidLoad()
        var beverage = [BeverageType.chocolate,BeverageType.cola]
        var vending = VendingMachine(inven.beverageList(beverage))
        print(vending.drinks())
        
        
        
    }


}
```

VendingMachine 객체 인스턴스를 ViewController 속성으로 inven 처럼 만드세요. 그래야 계속 사용할 수 있습니다.

