# enum

다른 언어의 열겨형과는 많이 다름

상속불가

(인스턴스/타입) 메서드,연산프로퍼티를 가질 수 있음

값타입

- Associated Value(연관값)

열거 내의 하나의 case에 대해 각 case 인스턴스마다 다른 값들을 가지게 하고 싶을 때 사용.

이는 개별 case와 함께 임의의 값들을 함께 저장하게 하여 강력하고 엄격한 타입 구분을 적용하면서 매우 유연하게 사용할 수 있게 해준다.

```swift
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}
```

만약 바코드와 QR코드를 구조체나 클래스로 표현했을 때는 다른 타입이겠지만, enum을 사용하면 단일 타입 내의 다른 case로 처리하여 개별적으로 다룰 수 있을 뿐만아니라, 코드 내에서는 이 둘을 같은 타입으로 다루는 것이 가능해진다.

연관값은 **패턴매칭**하여 사용 가능하다.

```swift
var productBarcode = Barcode.upc(3, 25, 153, 9)
productBarcode = .qrCode("helloworld")

switch productBarcode {
case .upc(let a, let b, let c, let d):
  print("UPC: \(a), \(b), \(c), \(d)")
case let .qrCode(message):
  print("QRCode: \(message)")
}
```

출처: <https://soooprmx.com/archives/7163>



다른 사용 예 >

```swift
enum Trade {
  case Buy(stock: String, amout: Int)
  case Sell(stock: String, amout: Int)
}

let trade = Trade.Buy(stock: "APPL", amout: 500)
```

