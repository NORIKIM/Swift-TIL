# Data
<br>
## 일반
스토리보드 ID를 이용해서 단순한 데이터를 전달할 때 사용

```swift
let second = self.storyboard.instantiateViewController(withIdentifier: “second”) as! SecondViewController
second.firstVCImage = firstImage
```

## Core Data

디바이스에 데이터를 저장할 때 사용하며 영구적으로 저장이 가능하다.

UserDefaults가 app setting같은 간단한 정보를 저장하기에 적합하다면 Core Data는 복잡하고 큰 user data를 저장하기에 적합하다.

그러나 Core Data가 데이터베이스는 아니다. Core Data는 객체 그래프를 관리하는 프레임워크이다. 객체 그래프를 디스크에 저장하여 객체에 더 중심을 둔다.

SQLite보다 많은 메모리를 사용하고, 더 많은 저장공간이 필요하지만 더 빠르게 데이터를 가져온다.

## SQLite

전 세계적으로 많이 사용되는 데이터베이스 엔진이며 오픈소스이다.

서버가 필요없으며 매우 작고 가벼워 전체 데이터베이스를 하나의 디스크파일에 저장 할 수 있다. 기기에 가벼운 DB를 저장하는 것을 목표로 설계된 것이다. 따라서 네트워크 통신이 없어도 데이터를 저장할 수 있다.

iOS, macOS에서 주로 사용된다.

## 라이브러리

### Realm

-> https://github.com/NORIKIM/Swift-TIL/blob/master/iOS/Realm.md

객체 중심의 데이터베이스로 ORM이 아니다

> ORM : Object Relatonal Mapping
>
> 객체와 관계형 데이터베이스의 데이터를 자동으로 매핑해주는 것
>
> 데이터를 접근하는 간단한 업무도 많은 쿼리문 작업이 필요하여 속도가 느리다

따라서, 백그라운에서 적용되는 SQL 쿼리문을 실행하지 않는다. 키-값 타입의 저장방식이 아닌 객체를 직접 디스크에 유지한다. 이로 인해 메모리 상의 객체를 빠르게 가져올 수 있고 메인 스레드에서 데이터를 읽기/쓰기 작업을 할 수 있다.

<br>

참고: https://purple-log.tistory.com/13