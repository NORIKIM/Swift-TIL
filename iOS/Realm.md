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

```swift
// 실습예제
@IBAction func check(_ sender: UIButton) {
  let result = realm?.objects(ShoppingList.self).filter("name Contains[cd] %@", itemTF.text).sorted(byKeyPath: "name", ascending: true)
}
// itemTF.text에 입력된 값으로 시작하는 모든 데이터 반환
// 만약 'name Contains[cd] %@' -> 'name = %@' 면, 입력된 값에 해당하는 데이터만 반환
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

```swift
// 실습예제
@IBAction func deleteData(_ sender: UIButton) {
    do {
      try realm?.write {
          guard let result = realm?.objects(ShoppingList.self).filter("name = %@", itemTF.text).first else { return }
          realm?.delete(result)
        }
    } catch {
        print("Error")
    }
}
```



## 쿼리 작성

Realm 문서 : https://realm.io/docs/swift/latest/#filtering

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

## 데이터 변동 실시간 반영

Realm documents :

https://realm.io/docs/swift/latest/#notifications



**Collection notifications**

​    Realm 전체를 알려주지는 않지만 변경 설명을 자세히 해준다.

​    collection notification은

​        마지막 알림으로부터 추가, 삭제, 수정된 객체의 인덱스로 구성되어있다. 

​        처음에는 초기 결과와 함께 비동기적으로 전달되며, write 후 다시 전달된다.

RealmCollectionChange reference :

https://realm.io/docs/swift/4.3.2/api/Enums/RealmCollectionChange.html#/s:10RealmSwift0A16CollectionChangeO7initialyACyxGxcAEmlF

<br>

```swift
notificationToken = 오브젝트배열프로퍼티.observe { [weak self] (changes: RealmCollectionChange) in
    guard let tableView = self?.테이블뷰아울렛 else { return }
    switch changes {
       case .initial:
         tableView.reloadData()
       case .update(_, let deletions, let insertions, let modifications):
        // 쿼리 결과가 변경되어 테이블에 적용
        tableView.beginUpdates()
        // 삭제, 삽입, 변경에 대해 항상 업데이트
        // 삭제 전 삽입 핸들링은 예상치 못한 동작이 발생 할 수 있다.
        tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
        tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
        tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
        tableView.endUpdates()
        case .error(let error):
        // 백그라운드 작업 스레드에서 Realm 파일을 열고 있는 동안 에러가 발생했다.
          fatalError("\(error)")
      }
    }
  }

// 객체 정리하기
  deinit {
    // 알림해제
      notificationToken?.invalidate()
  }
```

- RealmCollectionChange : Realm 알림이 보고하는 컬렉션의 변경에 대한 정보를 캡슐화한다.
  - Initial : 쿼리의 초기 실행이 완료되었으며 차단 작업을 수행하지 않고도 수집을 사용할 수 있음을 나타냄
  - Update : 객체를 변경하거나 수정됨을 나타냄