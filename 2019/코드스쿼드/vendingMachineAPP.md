# vendingMachineAPP step1. 아이패드 앱

<요구사항>

기존의 자판기 로직을 MVC로 분리

viewController 클래스에 음료 객체를 생성하여 내역을 콘솔에 출력



<코드 및 피드백>

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

-> 데이터에 대해 다룰 때 온도의 예로는 단순이 차갑다 뜨겁다가 아닌 영하부터 영상까지의 다양한 값이 존재 할수 있다. 따라서 좀 더 명확한 값을 받을 수 있도록 구현하는것이 바람직 하다.



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



<문제해결>

1. 불필요한 파일을 삭제해라

   처음에 기존의 VendingMachine 코드의 파일을 그대로 끌어다가 VendingMachineApp 프로젝트에 끌어와서 복붙 했더니 파일을 복사해서 복사본을 사용하지 않고 참조해버렸다.

   -> 불필요한 파일 자체는 아예 삭제해버리고 필요한 부분만 VendingMachine에서 swift파일을 복사하여 가져온다

   복사하여 붙여넣을 때 'choose options for adding these filses'창에서 'Copy items if needed'를 체크하고 'Added folders'에서 'Create groups'를 선택한다(Create folder references는 외부 사람이 파일을 추가하는 경우에 선택한다.)

2. ViewController 피드백

   vendingMachine의 초기화를 viewController의 viewDidLoad에서 해야했는데 

   ```swift
   init() {
           self.list = []
       }
       
       // 현재 보유 중인 음료 리턴
       func drinks(_ list: [Beverage]) -> [Beverage] {
           return list
       }
   ```

   이렇게 메소드를 이용하여 초기화함.

   이런 방식을 써도 되는건지는 모르겠지만 일단 PR...

-------------------------------

## 피드백 반영

**beverage.coffee**

```swift
class Coffee: Beverage {
    static let standardTemp = 65
    private let temperature: Int
    
    init(temperature: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.temperature = temperature
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 18144000, since: dateOfManufacture))
    }
    
    func isHot() -> Bool {
        return temperature > Coffee.standardTemp
    }
}
```



**beverage.milk**

```swift
class Milk: Beverage {
    enum GradeType {
        case A
        case B
        case C
    }
    
    private let grade: GradeType
    
    init(grade: GradeType, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.grade = grade
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 432000, since: dateOfManufacture))
    }
    
    func isGradeA() -> Bool {
        return grade == GradeType.A
    }
}
```



**ViewController**

```swift
class ViewController: UIViewController {
    var vending = VendingMachine()
    var inven = Inventory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var beverage = [BeverageType.chocolate,BeverageType.cola]
        var list = inven.beverageList(beverage)
        print(vending.drinks(list))
    }
}
```

# vendingMachineAPP step2. MVC 패턴

<문제해결>

1. 오토레이아웃을 이용하여 음료 이미지뷰들을 예쁘게 정렬

   이미지들을 `stack view`에 넣고 stack view에 Add new constraints를 추가 해주면 자동으로 이미지들의 사이즈와 위치가 고정됨

   - 양 옆, 위 의 사이즈
   - 높이

2. 추가 버튼을 누르면 어떤 음료의 재고가 추가되는지 어떻게 알지?

   2-1. 이미지들을 collectionView 사용하여 로드시키기

   ```swift
   import UIKit
   
   class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
       
       private var beverageImg = ["딸기우유.jpg","스프라이트.jpg","초코우유.jpg","카누아이스블랜드.jpg","콜라.jpeg","TOP라떼.jpeg"]
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }
   
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return beverageImg.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageCell", for: indexPath) as! BeverageCellCV
           cell.img.image = UIImage(named: beverageImg[indexPath.row])
           return cell
       }
   }
   
   class BeverageCellCV: UICollectionViewCell {
       @IBOutlet weak var img: UIImageView!
   }
   ```

   <img width="897" src="https://user-images.githubusercontent.com/31604976/61434147-25602500-a970-11e9-8631-ce6113ede5d1.png">

   <img src="https://user-images.githubusercontent.com/31604976/61434485-1168f300-a971-11e9-9639-c141111ee6af.png">

   참고 :

   https://medium.com/yay-its-erica/creating-a-collection-view-swift-3-77da2898bb7c

   https://abc1211.tistory.com/461

   https://iw90.tistory.com/241

   https://marlboroyw.tistory.com/529

3. 이미지뷰 테두리 둥글게 하기

   ```swift
    @IBOutlet weak var img: UIImageView! { didSet { setImgCornerRound() } }
       
       func setImgCornerRound() {
           img.layer.cornerRadius = 10
           img.layer.masksToBounds = true
       }
   ```

   **masksToBounds의 역할**

   masksToBounds이 없어도 이미지뷰의 테두리는 둥글게 만들어지는데 이 메소드를 사용하는 이유! 뷰위의 콘텐츠가 영향을 받게 할지 안할지에 대한 옵션 같은 것.

   true로 설정하면 콘텐츠에 영향이 가게 되고 false로 하면 영향이 안감.

   참고 : https://zeddios.tistory.com/37