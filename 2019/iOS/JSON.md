# JSON

- 인코딩과 디코딩

  인코딩 : 어떤 정보의 형태나 형식을 다른 형태나 형식으로 변환 

  디코딩 : 인코딩의 반대 작업

- Codable

  Decodable 과 Encodable을 합한 타입으로 인코딩 및 디코딩을 하려면 반드시 체택해야 하는 프로토콜

JSON 타입을 이용하기 위해 JSONEncoder와 JSONDecoder를 사용하는데 스위프트 4 이전에는 JSONSerialization을 이용하여 JSON을 생성했지만 스위프트 4 이후에는 JSONEncoder와 JSONDecoder를 사용하여 손쉽게 인코딩 디코딩이 가능해졌다.

**JSONEncoder**

```swift
struct Grocery: Codable {
    var name: String?
    var points: Int
    var importContry: String?
}

var grocery = Grocery(name: "바나나", points: 20, importContry: "필리핀")

let encode = JSONEncoder()
encode.outputFormatting = .prettyPrinted

do {
    let data = try encode.encode(grocery)
    print(String(data: data, encoding: .utf8)!)
} catch {
    print(error)
}
```

```swift
// 출력
{
  "name" : "바나나",
  "points" : 20,
  "importContry" : "필리핀"
}
```

**JSONDecoder**

```swift
let json = """
{
    "name" : "바나나",
    "points" : 20,
    "importContry" : "필리핀"
}
""".data(using: .utf8)!

let decode = JSONDecoder()

do {
    let product = try decode.decode(Grocery.self, from: json)
    print(product.name!)
} catch {
    print(error)
}
```

```swift
//출력
바나나
```

