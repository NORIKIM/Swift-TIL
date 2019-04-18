# 옵셔널

값이 있을 수도 있고 없을 수도 있음을 표현

- 사용하는 이유!

추후 앱의 CRASH를 방지하는 이유가 가장크다.  메모리 박스에 값이 있다고 확정했지만 값이 없다면 앱이 죽게 되므로 옵셔널을 사용하여 하나의 보호막을 만들어준다.

## 옵셔널 체인

클래스나 구조체에서 옵셔널을 이용할 경우 nil 여부를 검사하기 위해 if를 중첩 사용하여 검사해야 한다.

```swift
struct Human {
    var name : String?
    var man : Bool = true
}

struct Compayny {
    var ceo : Human?
    var companyName : String?
}

var startUp : Compayny? = Compayny(ceo: Human(name: "나대표", man: false),
																		companyName: "루비페이퍼")
```


```swift
if let company = startUp {
    if let ceo = Company.ceo {
        if let name = ceo.name{
            print("대표이사 이름은 \(name)입니다")
        }
    }
}
```

이러한 과정을 피하고 코드를 더욱 간결하게 작성하기 위해 강제언랩핑을 사용할 수 있지만 혹시라도 nil을 포함하고 있다면 런타임 오류가 발생하기 때문에 추천할 만한 방법은 아니다.

강제 언랩핑 코드 >

```swift
if let name = startUp!.ceo!.name{
    print("대표이사 이름은 \(name)입니다")
}
```

이러한 옵셔널의 단점을 극복하고 복잡한 코드를 간단하게 줄여주는 방법이 옵셔널 체인이다.

옵셔널 체인 코드 >

```swift
if let name = startUp?.ceo?.name {
    print("대표이사 이름은 \(name)입니다")
}
```

만약 startUp변수나 ceo 프로퍼티가 빈 값이라면 아무런 값도 할당되지 않은 채로 구문은 종료 된다. nil객체의 프로퍼티에 값을 할당해줄 수 없기 때문. 하지만 오류는 발생하지 않으므로 안전하게 값을 할당할 수 있다.

+옵셔널 체인의 특징

1. 옵셔널 체인으로 참조된 값은 무조건 옵셔널 타입으로 반환된다.
2. 옵셔널 체인 과정에서 옵셔널 타입들이 여러 번 겹쳐 있더라도 중첩되지 않고 한 번만 처리된다.

    optional(optional(optional(123))) = optional(123)