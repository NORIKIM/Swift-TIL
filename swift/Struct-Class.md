# Struct & Class

구조체의 인스턴스 - 값을 복사함 / 상속X

클래스의 인스턴스 - 값을 참조함 / 상속O

값타입, 참조타입?  https://medium.com/@abhimuralidharan/difference-between-value-type-and-a-reference-type-in-ios-swift-18cb5145ad7a

-> 값을 복사하고 참조한다의 의미

```swift
func increase(from var value: inout Int) {
  value = value + 1
}
var num = 1
increase(&num) // 값이 아닌 주소를 넘기는 방식
// 만약 인자가 클래스 타입이라면 주소 값이 넘어감.(원본)
// 만약 인자가 구조체 타입이라면 값이 복사되어 넘어감.(사본)
```

참조를 하게 되면 원본의 주소를 알려주는 것이기 때문에 값의 변경 가능성이 있으므로 사이드 이팩트가 발생할 수 있다.

```swift
// 메모리 주소 확인하는 메소드 만들기
func print(address o: UnsafeRawPointer) {
  print(String(format: "%p", Int(bitPattern: o)))
}

var array1 : [Int] = [0,1,2,3]
var array2 = array1

print(address: arrary1) //0x600000078de0
print(address: arrary2) //0x600000078de0

array2.append(4)
print(address: array2) //0x6000000aa100

```

따라서!,

데이터를 관리할 때(model) 구조체 사용  

화면에 뭔가 표현해줄 때(view) 클래스 사용

- 공통점

  프로퍼티 정의

  메서드 정의

  서브스크립트 정의 -> 서브스크립트?

  https://jusung.gitbook.io/the-swift-language-guide/untitled-8

  초기화될 때의 상태 지정을 위해 이니셜라이저 정의

  새로운 기능 추가를 위한 extension을 통해 확장 가능

  프로토콜 준수 가능

- 차이점

  타입캐스팅은 클래스의 인스턴스에만 활용 가능

  이니셜라이즈는 클래스의 인스턴스에만 활용 가능

  참조 횟수(Reference Counting)은 클래스의 인스턴스에만 적용 가능

  -> 참조 횟수? = 가비지컬렉터?
  
  https://feel5ny.github.io/2017/11/30/JS_02/



++copy on wirte에 대해 더 알아보기!



## Class

iOS 프레임워크 대부분의 큰 뼈대는 모두 클래스로 구성

- 이니셜라이저

  빈 메모리 공간에 접근하지 않도록 하기 위해 어떤 인스턴스를 만들 때 클래스의 속성의 값이 비어있지 않아야 한다. 

  만약 프로퍼티에 값을 넣지 않아도 될때는 옵셔널로 선언한다.

  

  - 실패가능한 이니셜라이저

  : 이니셜라이저를 통해 인스턴스가 초기화되지 못하는 여러 가지 예외 상황이 발생하여 인스턴스 초기화에 실패할 가능성을 염두하고 실패 가능성을 내포한 이니셜라이저

  실패하였을 때 nil을 반환하므로 반환 타입이 옵셔널

  ```swift
  struct Animal {
    let species: Stringinit
    init?(species: String) {
      if species.isEmpty { return nil }
      self.species = species
    } 
  }
  ```



>지정 이니셜라이저(Designated Intializer)

클래스의 모든 저장 속성을 초기화(클래스의 주요 이니셜라이저)

부모 클래스의 이니셜라이저 호출가능

반드시 한개 이상의 지정 이니셜라이저가 있어야 함

```swift
struct Person {
  var height: Double
  var weight: Double
  var footSize: Int
  
  init(height: Double, weight: Double, footSize: Int) {
    self.height = height
    self.weight = weight
    self.footSize = footSize
  }
}
/*
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
*/
```

>편의 이니셜라이저(Convenience Intializer)

지정 이니셜라이저의 일부 매개변수의 기본 값을 설정하여 초기화

편의 이니셜라이저는 지정 이니셜라이저를 자신 내부에서 호출.

더 적은 입력으로 초기화를 편리하게 할 수 있도록 해줌

지정 이니셜라이저의 매개변수가 많아 외부에서 일일이 전달인자를 전달하기 어렵거나 특정 목적에 사용하기 위해서 편의 이니셜라이저를 설계할 수도 있습니다. 예를 들어 특정 목적으로 인스턴스를 생성할 때 일부 프로퍼티는 클래스 설계자가 의도한 대로 초깃값을 지정해줘야 합니다. 편의 이니셜라이저를 사용하면 항상 같은 값으로 초기화가 가능합니다.

사용이유: 파라미터를 전부 보내기 힘들거나 굳이 보낼 필요가 없는 경우 - 편리성 

```swift
class Shape { 
  var numberOfSides: Int = 0
  var name: String
  init(name: String) { 
    self.name = name 
  } 
} 

class Square: Shape {
  var sideLength: Double = 0.0
  init(sideLength: Double, name: String) { 
    self.sideLength = sideLength 
    super.init(name: name) 
    numberOfSides = 4
  }
}
```

> 열거형의 이니셜라이저

```swift
enum PowerRanger: String {
  case red
  case blue = "블루"
  case black
  
  init(call: Character) {
    switch call {
      case "r", "R" : self = .red
      case "b", "B" : self = .blue
      default: self = .black
    }
  }
}
let callToDoctor = PowerRanger(call: "R") // red
let callToDoctor2 = PowerRanger(rawValue: "레드") //nil
let callToDoctor3 = PowerRanger(rawValue: "블루") //blue
```



- 상속

  스위프트는 다중상속을 지원하지 않는다. 다중 상속의 개념을 적용 하고 싶을 때는 프로토콜을 이용하면된다. -> 다중상속을 지원하지 않는 이유?

  -> 구조의 복잡도를 낮추기 위함
  
  (슈퍼클래스->서브클래스->서브클래스 의 상속은 가능)
  
- override

  프로퍼티 오버라이딩 : 프로터티 자체가 아니라 프러터피 의 접근자getter,설정자setter,감시자observer

  메소드 : 매개변수 개수나 타입,그리고 반환타입은 변경 불가->overloading을 제공하기 때문: 이름은 똑같지만 전혀 다른 메소드로 인식한다

  변경할 수 있는 것은 오로지 내부 구문들 뿐

  Preventing: 재정의를 원하지 않을 때는 키워드 앞에 final키워드를 붙여주기만 하면 오버라이드를 못하게 막을 수 있다. 상속을 못하게 하려면 private키워드를 붙여주면 된다.

> Deinitialization

[여기에서 알아보자](https://github.com/NORIKIM/Swift-TIL/blob/master/swift/ARC.md)

## Struct

스위프트 대부분의 큰 뼈대는 모두 구조체로 구성(Int, string, double 등등)

참조 카운트가 없어서 메모리 관리 안전

참조 형태가 아니기 때문에 공유가 불가능

불변성(immutable) 구현에 유리

멀티스레딩에 안전 -> 원본에 안정성을 가지고 있으므로 다른 여러 곳에서 사용한다고 하더라도 손실방지가 가능하다.

상속은 불가능 하지만 프로토콜은 사용 할 수 있다

> 구조체 조건

연관된 간단한 값의 집합을 캡슐화 하는 것이 목적일 때

캡슐화된 값이 참조되는 것보다 복사되는 것이 합당할 때 

구조체의 저장 프로퍼티가 값 타입이며 참조되는 것보다 복사되는 것이 합당할 때 = 원본 데이터를 회손하고 싶지 않을 때

다른 타입으로 부터 상속 받거나 자신이 상속된 필요가 없을 때

> 애플에서는 구조체를 권장한다?

강력히 구조체를 사용 하라고 하는 것은 아니다. 스위프트 언어 자체가 구조체의 사용의 장점을 부각시키는 것 뿐이다. 구조체를 사용했을 때, 클래스를 사용했을 때의 장단점을 활용하여 어떤 것을 쓸지 결정하는 것이고 결정했을 때는 어떠한 이유로 사용했는지에 대해 인지하고 설명할 수 있어야 한다. 

> initialization

구조체 안에 선언된 변수들은 옵셔널이 아닌 이상 꼭 값이 있어야 한다는 것을 의미

init은 인스턴스를 생성할 때 해주면 되지 구조체 안에 해주는 이유 : 옵셔널 같이 값이 있을수도 없을 수도 있는 상황에 인스턴스 생성 시 init에 적어주지 않아도 되도록 해준다.

```swift
struct Person {
    let name: String // let 상수는 무조건 init 안에서 초기화 해줘야 한다
    var age: Int
    var nick: String?
    
    init(name: String, age: In, nick: String? = nil) { // 1. 디폴트 값이 있으면
        self.name = name
        self.age = age
        self.nick = nick
    }
}

var yagom = Person.init(name: "d", age: 10) // 2. 인스턴스안에서 불러오지 않아도됨(권장X)
var jina = Person.init(name: "d", age: 10, nick: "dd") 
```
