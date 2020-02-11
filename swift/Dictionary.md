- 두개의 배열로 딕셔너리 만들기

```swift
var identic = ["A", "B", "C", "D"]
var linef = ["1", "2", "3"]

var Fullstack = [String: String]()
for i in 0..<min(linef.count, identic.count) {
  Fullstack[identic[i]] = linef[i]
}

print(Fullstack) // "[A: 1, B: 2, C: 3]"
```

- 딕셔너리 값 수정

  ```swift
  Dictionary.updateValue(Key, forkey: Values)
  
  var dic : [Int : String] = [1:"zedd", 2:"swift", 3:"iOS"]
  
  dic.updateValue("fun", forKey: 3)
  
  print(dic)//[1:"zedd", 2:"swift", 3:"fun"]
  
  dic[3] = "iOS"
  
  print(dic)//[1:"zedd", 2:"swift", 3:"iOS"]
  ```
  
  ```swift
  // 사용
  func palindromeRearranging(inputString: String) -> Bool {
      var arr = inputString.map{String($0)}
      var dic = [String:Int]()
      var count = 0
      
      for i in 0 ..< arr.count {
          if dic[arr[i]] == nil {
              dic.updateValue(1, forKey: arr[i])
          } else {
              dic.updateValue(dic[arr[i]]! + 1, forKey: arr[i])
          }
      }
     
      for num in dic.values {
          count += (num % 2)
      }
  
      return count == 0 || count == 1
  }
  
  palindromeRearranging(inputString: "aaabbbccc")//false
  ```
  
  

- 딕셔너리 값 생성 자동화?

  **실습해보기**

```swift
struct User {
    var userID: String
    var nameSurname: String
    var email: String
    var password: Int
    var profileImageUrl: String

    var userDictionary: [String: Any] {
        return [
            "userID": userID,
            "nameSurname": nameSurname,
            "email": email,
            "password": password,
            "profileImageUrl": profileImageUrl,

        ]
    }
}

extension User {

    init?(dictionary: [String: Any]) {
        guard let userID = dictionary["userID"] as? String,
            let nameSurname = dictionary["nameSurname"] as? String,
            let email = dictionary["email"] as? String,
            let password = dictionary["password"] as? Int,
            let profileImageUrl = dictionary["profileImageUrl"] as? String else { return nil }

        self.init(userID: userID, nameSurname: nameSurname, email: email, password: password, profileImageUrl: profileImageUrl)
    }

}

let user = User(userID: "burak", nameSurname: "burak", email: "burak", password: 1234, profileImageUrl: "brk")
print(user.userDictionary)
```


**value로 key값 가져오기**

```swift
func findKeyForValue(value: String, dictionary: [String: String]) ->String? {
        for (key, array) in dictionary {
            if (array.contains(value)) {
                return key
            }
        }

        return nil
}

let drinks = ["Soft Drinks": ["Cocoa-Cola", "Mountain Dew", "Sprite"],
        "Juice" :["Orange", "Apple", "Grape"]]

print(self.findKeyForValue("Orange", dictionary: drinks))
```


**해당하는 인덱스의 key와 value 가져오기**

```swift
let weatherDic = ["해":"sunny","구름":"cloudy","비":"rainy","눈":"snowy"]
let key = Array(weatherDic.keys)[인덱스번호]
let value = Array(weatherDic.values)[인덱스번호]
```
