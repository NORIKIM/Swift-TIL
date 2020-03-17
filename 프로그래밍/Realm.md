# Realm

작업속도가 빠른 모바일용 데이터베이스 라이브러리 오픈소스



[설치방법](https://github.com/NORIKIM/Swift-TIL/blob/master/iOS/Cocoapods.md)



xcworkspace에서 작업한다

RealmSwift를 import하고

데이터베이스 모델을 생성

기본적으로 데이터를 생성 **C**, 읽기 **R**, 업데이트 **U**, 삭제 **D** 할 수 있다.



## C

```swift
class Player: Object {
    @objc dynamic var name = ""
    @objc dynamic var position = ""
    @objc dynamic var age = Int()
}

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
        
  let realm = try! Realm()
  let park = Player()
        park.name = "Park"
        park.position = "CD"
        park.age = 20
        
        do {
            try realm.write {
                realm.add(park)
            }
        } catch {
            print("Error Add \(error)")
        }
}
```

## R

```swift
// realm 데이터베이스를 불러옴, 반환값은 Results<>타입의 값으로 반환
var player: Results<Player>
player = realm.objects(Player.self)
```

## U

```swift
do {
  try realm.write {
    park.positon = "CF"
  }
} catch {
  print("Error Update \(error)")
}
```

## D

```swift
do {
  try realm.write {
    realm.delete(part)
  }
} catch {
  print("Error Delete \(error)")
}
```

## 쿼리 작성

player 변수를 이용하여 작성한다.

```swift
var playerList = player
playerList = playerList.filter("name Contains[cd] %@", "kim").sorted(byKeyPath: "name", ascending: true)
```

<img src="https://user-images.githubusercontent.com/31604976/76733920-194d9100-67a5-11ea-86a1-c5c50750caf6.jpeg">

<br>

## 데이터베이스 확인

```swift
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
     return documentsDirectory
}

OR

print(Realm.Configuration.defaultConfiguration.fileURL!)
```

getDocumentsDirectory 리턴값을 출력하면 콘솔창에 Realm Studio 파일의 경로가 나타난다.

해당 경로의 `default.realm`을 실행하면 내가 추가한 데이터베이스를 확인할 수 있다.

<br>

참고 : https://tonyw.tistory.com/3