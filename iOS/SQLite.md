# SQLite

> 데이터베이스 준비

```swift
import Foundation
import UIKit

class myList {
    var name: String
    var age: String
    var photo: UIImage
    var date: Date
    
    init(name: String, age: String, photo: UIImage, date: Date) {
        self.name = name
        self.age = age
        self.photo = photo
        self.date = date
    }
}
```

```swift
import UIKit
import SQLite3

struct DBHelper {
    static let shared = DBHelper()
    var db: OpaquePointer?
    
    init() {
        db = openDB()
        createTable()
    }
}
```
> 데이터베이스 파일 생성

```swift
func openDB() {
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("myDB")
    var statement: OpaquePointer? = nil
    
    if sqlite3_open(fileURL.path, &statment) != SQLITE_OK {
        print("Error opening DB")
        return nil
    } else {
        print("Success opening DB")
    }
}
```
> 데이터베이스 테이블 생성

```swift
func createTable() {
    // id INTEGER primary key AUTOINCREMENT: 각 행의 고유 번호를 자동으로 1씩 증가해 붙여준다.
    let create = "CREATE TABLE IF NOT EXISTS myDB(id INTEGER primary key AUTOINCREMENT, name TEXT, age TEXT, photo BLOB, date TEXT)"
    var statement: OpaquePointer? = nil
    
    if sqlite3_prepare_v2(db, create, -1, &statement, nil) == SQLITE_OK {
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Success create table")
        } else {
            print("create table statement could not be prepared")
        }
        
        sqlite3_finalize(statement)
    }
}
```

- autoincrement : 추가 CPU, 메모리, 디스크 공간 및 디스크 오버헤드를 부과하므로 필요하지 않은 경우에는 사용하지 않아야 한다. autoincrement의 목적은 이전에 삭제 된 행에서 ROWID의 재사용을 방지하는 것으로 일반적으로 사용할 일은 거의 없다.

참고: https://www.debugcn.com/ko/article/21337327.html

> 데이터베이스 테이블 읽어오기

```swift
func readDB() -> [myList] {
    let select = "SELECT * FROM myDB"
    var statement: OpaquePointer? = nil
    var list = [myList]()
    
    if sqlite3_prepare_v2(db, select, -1, &statement, nil) == SQLITE_OK {
        while sqlite3_step(statement) == SQLITE_ROW {
            let name = String(describing: String(cString: sqlite3_column_text(statement,1))) // 여기의 숫자 1은 읽어오는 순서를 말하며 id INTEGER primary key AUTOINCREMENT가 없다면 0부터 시작한다.
            let age = String(describing: String(cString: sqlite3_column_text(statement,2)))
            let length = Int(sqlite3_column_bytes(statement,3))
            let photoData = NSData(bytes: sqlite3_column_blob(statement,3), length: length)
            let photo = UIImage(data: photoData as Data)
            let date = Date(timeIntervalSinceReferenceDate: sqlite3_column_double(statement,4))
            
            list.append(name: name, age: age, photo: photo, date: date)
        }
    } else {
        print("Error select statement could not be prepared")
    }
    
    sqlite3_finalize(statement)
    return list
}            
```

> 데이터베이스 데이터 삽입

```swift
func insert(name: String, age: String, photo: UIImage, date: Date) {
    let insert = "INSERT INTO myDB(name, age, photo, date) VALUES(?,?,?,?)"
    var statement: OpaquePointer? = nil
    let photoData = photo.pngData() as NSData?
    
    if sqlite3_prepare_v2(db, insert, -1, &statement, nil) == SQLITE_OK {
        sqlite3_bind_text(statement, 1, (name as NSString).utf8String, -1, nil)
        sqlite3_bind_text(statement, 2, (age as NSString).utf8String, -1, nil)
        sqlite3_bind_blob(statement, 3, photoData.bytes, Int32(photoData.length), nil)
        sqlite3_bind_double(statement, 4, date.timeIntervalSinceReferenceDate)
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Success insert")
        } else {
            print("Error could not insert")
        }
    } else {
        print("Error insert statement could not be prepared")
    }
    
    sqlite3_finalize(statement)
}
```

> 데이터베이스 데이터 삭제

```swift
func delete(row: Int32) { 
    let delete = "DELETE FROM myDB WHERE id = ?"
    var statement: OpaquePointer? = nil
    
    if sqlite3_prepare_v2(db, delete, -1, &statement, nil) == SQLITE_OK {
        sqlite3_bind_int(statement, 1, row)
        
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Success delete")
        } else {
            print("Error delete")
        }
    } else {
        print("Error delete not be prepared")
    }
    
    sqlite3_finalize(statement)
}
```
 
 > 데이터베이스 테이블 확인하는 방법
 
 DB Browser를 이용할 수 있다.
 먼저, sqlite 파일 위치를 확인한다
 
 1. 경로이동 cd Library/Developer/CoreSimulator/Devices
 
 2. 파일이름으로 상세경로 찾기 find $PWD -name "myDB.sqlite" -print
 
 3. 상세경로 /Users/oingbong/Library/Developer/CoreSimulator/Devices/시뮬레이터 identifier/data/Containers/Data/Application/앱 암호화 이름/Documents/myDB.sqlite
 
 4. 테이블 열기 open /Users/user이름/Library/Developer/CoreSimulator/Devices/시뮬레이터 identifier/data/Containers/Data/Application/앱 암호화 이름/Documents/myDB.sqlite
 