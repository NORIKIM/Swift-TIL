import Foundation
import RxSwift

// observable은 subscibe 되어야만 방출할 수 있다.


// Int를 방출할 옵저버블.하나의 요소만
//Observable<Int>.just(1)
//    .subscribe(onNext: {
//        print($0) // 1
//    })
//
//
//// of안의 요소들을 순차적으로 방출
//Observable<Int>.of(1,2,3,4,5)
//    .subscribe(onNext: {
//        print($0) // 12345
//    })
//// 하나의 배열만 방출
//Observable.of([1,2,3,4,5])
//    .subscribe(onNext: {
//        print($0) // 1,2,3,4,5]
//    })
//// 배열의 형태만 받아 하나씩 방출
//Observable.from([1,2,3,4,5])
//    .subscribe(onNext: {
//        print($0) // // 12345
//    })




//Observable.of(1,2,3)
//    .subscribe {
//        print($0)
//        /*
//         next(1)
//         next(2)
//         next(3)
//         completed
//         */
//    }
//
//Observable.of(1,2,3)
//    .subscribe {
//        if let element = $0.element {
//            print(element)
//            /*
//             1
//             2
//             3
//             */
//        }
//    }
//
//Observable.of(1,2,3)
//    .subscribe(onNext: {
//        print($0)
//        /*
//         1
//         2
//         3
//         */
//    })





// 아무런 이벤트 방출하지 않는다
// 타입도 지정하지 않았기 때문에 타입 추론이 불가능
// 즉시 종료 할 수 있는 옵저버블 리턴
// 의도적으로 0개의 값을 가지는 옵저버블을 리턴하고 싶을 때 사용
//Observable.empty()
//    .subscribe {
//        print($0) // 아무것도 출력되지 않음
//    }
//
//Observable<Void>.empty()
//    .subscribe {
//        print($0) // completed
//    }
//// 위 코드와 같은 의미
//Observable<Void>.empty()
//    .subscribe(onNext: {
//    },
//    onCompleted: {
//        print("completed") // completed
//    })





// empty와 반대의 개념
// 작동은 하지만 아무것도 방출하지 않는 것
//Observable.never()
//    .debug("never") // never -> subscribed
//    .subscribe(onNext: {
//        print($0)
//    },
//    onCompleted: {
//        print("Completed")
//    })




// 범위에 있는 배열을 만들어줌
