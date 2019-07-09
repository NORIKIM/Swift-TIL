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


