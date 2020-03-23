# ARC (Automatic Reference Counting)

Swift 자동 메모리 관리 기술

인스턴스가 더 이상 필요가 없을 때 클래스 인스턴스에 사용된 메모리를 자동적으로 해제한다.

그러나 보통은 ARC가 자동으로 메모리를 관리해줘서 메모리에 대해 신경쓰지 않아도 되지만,  외부 리소스 사용 시에는 수동으로 메모리를 해제해주어야 한다.

예를 들어, 인스턴스 내부에서 파일을 불러와 열게 되면 인스턴스를 소멸하기 전에 파일 저장하고 닫아주는 등의 부가 작업이 필요하다.

인스턴스가 필요한 동안에는 사라지지 않도록 ARC는 현재 각 클래스 인스턴스를 참조하는 속성,상수 및 변수의 수를 추적하여 참조 수가 하나 이상 존재 하면 인스턴스를 해제 하지 않는다.

> 참조 횟수

참조 횟수가 0이 되는 순간 메모리에서 해제된다.



인스턴스를 다른 인스턴스의 프로퍼티나,변수,상수에 할당 => +1

강한참조를 사용하는 프로퍼티나,변수,상수에 nil 할당 => -1



## 강한 참조

참조의 기본은 강한참조이다. 클래스의 프로퍼티,변수,상수 등을 선언할 때 별도의 식별자를 명시하지 않으면 강한참조를 하게 된다.

```swift
class Person {
  let name: String
  
  init(name: String) {
    self.name = name
    print("\(name) is being initialized")
  }
  deinit {
    print("\(name) is being deinitialized")
  }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "nori")
// nori is being initialized
// 참조횟수 0 -> 1

ref2 = ref1 // 참조횟수 1 -> 2
ref3 = ref1 // 참조횟수 2 -> 3

ref3 = nil // 참조횟수 3 -> 2
ref2 = nil // 참조횟수 2 -> 1
ref1 = nil // 참조횟수 1 -> 0
// nori is being deinitialized
```

## 약한 참조

강한참조와 달리 참조 횟수를 증가시키지 않고 선언자 앞에 weak를 붙이면 자신이 참조하는 인스턴스를 약한 참조 한다.

자신이 참조하던 인스턴스가 메모리에서 해제되면 nil이 할당 될 수 있어야 하므로 상수에서는 쓰일 수 없고 옵셔널이어야 한다.

```swift
class Room{
  let number: String
  
  init(number: String) {
    self.number = number
  }
  
  weak var host: Person?
  
  deinit {
    print("Room \(number) is being deinitailized")
  }
}

var nori: Person? = Person(name: "nori")
// Person 참조횟수 0 -> 1
var room: Room? = Room(number: "1708")
// Room 참조횟수 0 -> 1

room?.host = nori // Person 참조횟수 1
nori?.room = room // Room 참조횟수 1 -> 2

nori = nil
// Person 참조횟수 1 -> 0
// Room 참조횟수 2 -> 1
// nori is being deinitialized

print(room?.host) // nil

room = nil
// Room 참조횟수 1 -> 0
// Room 1708 is being deinitialized
```

## 소유하지 않은 참조

약한참조와 다르게 자신이 참조하는 인스턴스가 항상 메모리에 존재할 것이라는 전제를 기반으로 동작한다. 즉, 자신이 참조하는 인스턴스가 메모리에서 해제되더라도 스스로 nil을 할당해주지 않는다는 뜻.

변수나 프로퍼티 앞에 unowned를 써주면 자신이 참조하는 인스턴스를 미소유참조하게 된다.

참고 :

https://velog.io/@delmasong/ARCAutomatic-Reference-Counting

http://jhyejun.com/blog/memory-management-arc

http://jhyejun.com/blog/how-to-use-weak-and-unowned