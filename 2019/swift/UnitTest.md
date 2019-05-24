# Unit Test

1. file - new - target - macOS unit Testing Bundle
2. 프로젝트 파일(파란색 xcode 아이콘) 클릭 - target의 unitTest파일 클릭 - Build Phases - Compile Sources - +클릭 - 원하는 파일 전부 선택 후 확인
3. 프로젝트 네비게이터의 unitTest폴더의 swift파일 클릭
4. import XCTest 하단에 @testable import 프로젝트 명 작성
5. Unit Test 시작

++ test build = command + T

++ input, output은 테스트 하지 않는다.

**테스트는 그 함수가 잘 동작하는지를 확인하는것**

**이 함수가 성공하는 조건 실패하는 조건에 대해 테스트를 해보면 됨.**

## setUp() /  tearDown()

각 테스트가 실행되기 전에 setUp() 메소드가 호출되고 각 테스트 케이스가 실행된 후 tearDown() 메소드가 실행된다.

테스트는 결과를 얻기 위해 테스트 객체에서 수행 할 동작 만 포함되어야 하며, 이 메서드들은 테스트 코드를 깨끗하고 유연하게 유지하는데 도움을 준다.

setUp : 초기화 코드

​			첫 번째 테스트가 실행되기 전에 한번 호출된다.

​			항목이 존재해야하거나 특정 상태(객체 인스턴스 만들기, db초기화, 규칙 작성 등)가 필요한 테스트가 있을 때 사용한다.

 tearDown : 해체코드 

​					모든 개별 테스트가 실행 된 후 끝날 때 한번 호출된다.

​					각 테스트가 시작된 위치에서 멈춰야 한다는 것을 알기 때문에 앱 상태를 초기 상태(파일닫기, 연결, 새로 만든 항목 제거, 트랜잭션 콜백 호출 등)로 복원해야 할 때 사용한다.

따라서 **각 테스트 케이스가 공통적인 준비와 마무리 과정이 필요하다면 여기에다 필요한 내용을 구현하면 된다.**

### 테스트 함수

- XCTFail(format...) : Xcode에게 무조건 실패했음을 알리기 위한 용도, 복잡한 코드로 직접 검증한 뒤 문제가 있다면 XCTFail을 호출하도록 코딩하면 되는 용도인데 사실 거의 쓸 일은 없다.

- XCTAssertNil(a1, format...) : a1의 결과가 nil 이어야 한다는 것을 의미한다. 만약 nil이 아니라면 테스트가 실패한다.

- XCTAssertNotNil(a1, format...)

- XCTAssert(a1, format...)

- XCTAssertTrue(a1, format...)

- XCTAssertFalse(a1, format...)

- XCTAssertEqualObjects(a1, a2, format...)

- XCTAssertEquals(a1, a2, format...) : a1과 a2의 결과가 동일해야 테스트가 성공

- XCTAssertEqualsWithAccuracy(a1, a2, format...)

- XCTAssertThrows(expression, format...)

- XCTAssertThrowsSpecific(expression, specificException, format...)

- XCTAssertThrowsSpecificNamed(expression, specificException, specificName, format...)

- XCTAssertNoThrow(expression, format...)

- XCTAssertNoThrowSpecific(expression, specificException, format...)

- XCTAssertNoThrowSpecificName(expression, specificException, specificName, format...)

- 구조체 테스트 예제

  struct Person { var name: String var hairColor: String?

  ```
    init(name: String, hairColor: String = nil) {
        self.name = name
        self.hairColor = hairColor
    }
  ```

  }

  --------UnitTest func testInit_shouldTakeName() { let person = Person(name: "John") XCTAssertEqual([person.name](http://person.name), "John") }

  func testInit_shouldTakeHairColor() { let person = Person(name: "jina",hairColor: "Brown") XCTAssertEqual([person.name](http://person.name), "jina") XCTAssertEqual(person.hairColor, "Brown") }

- 소프트웨어공학

에자일 : 개발 방법론이 아니라, 개발을 가능하게 해주는 다양한 방법론 전체를 말함(좋은것을 빠르고 낭비없게 만드는 것)

UML : 객체 간 상호작용을 표현할 수 있는 하나의 총체적 언어, 눈으로 보기 쉽게 다이어그램으로 주요 표현됨.(이것의 의미가 다이어그램은 아니다) 개발방법론 + 모델 + 클래스 들이 모두 표현되어야 하고 상호관계까지도..

- TDD

새로운 함수를 생성 했을 때 기능만 테스트하면 사이드 이팩트 발견이 어렵기 때문에 중요함

순서대로 보면 좋습니다

1. https://www.raywenderlich.com/709-ios-unit-testing-and-ui-testing-tutorial
2. https://www.raywenderlich.com/5522-test-driven-development-tutorial-for-ios-getting-started
3. https://www.raywenderlich.com/1752-unit-testing-tutorial-mocking-objects
4. https://github.com/devxoul/LetsGitHubSearch