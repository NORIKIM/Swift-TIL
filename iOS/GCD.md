# GCD (Grand Central Dispatch)

애플에서 개발한 기술로 멀티코어와 멀티프로세싱 환경에서 최적화된 프로그래밍을 할 수 있도록 해준다.

스레드 풀의 관리를 프로그래머가 아닌 운영체제에서 관리하기 때문에 프로그래머가 테스크를 비동기적으로 쉽게 사용할 수 있다.

프로그래머가 테스크를 생성하고 Dispatch Queue에 추가하면 GCD는 테스크에 맞는 스레드를 자동으로 생성해서 실행하고 작업이 종료되면 해당 스레드를 제거한다.

**디스패치 대기열(Dispatch Queue)**

GCD 기술의 일부

작업 항목의 실행을 관리하는 클래스

작업을 연속적 혹은 동시에 진행하지만 FIFO순으로 실행

주로 iOS에서는 서버에서 데이터를 다운받거나 이미지,동영상 등의 멀티미디어 처리 같이 CPU 사용량이 많은 처리를 별도의 스레드에서 처리한 뒤 메인 스레드로 결과를 전달하여 화면에 표시한다.

**큐의 유형**

- Serial Dispatch Queue(=main) : 한번에 하나의 작업만을 실행하며, 해당 작업이 대기열에서 제외되고 새로운 작업이 시작되기 전까지 기다리는 기본 유형이다.

- Concurrent Dispatch Queue(=global) : 시작된 작업의 완료를 기다리지 않고 대기열에 있는 작업을 동시에 별도 스레드를 사용하여 진행한다. (즉, 병렬처리 방식으로 작업의 우선순위는 시스템이 정한다.)

**디스패치 큐의 장점**

- 쉽고, 간결한 프로그래밍 인터페이스 제공
- 자동적이고 전체적인 스레드 풀 관리기능 제공
- 적절히 조율된 어셈블리어의 속도 제공
- 메모리 관리에 효율적(스레드 스택이 어플리케이션 메모리에 남지 않기때문)
- 커널의 부하를 주지 않는다.
- 디스패치큐를 통한 작업 비동기 전송은 대기열에 교착상태(deadlock)를 야기하지 않는다.
- 문제가 있을때 근사하게 확장할 수 있다.
- Serial Dispatch Queue는 다른 초기 동기화 기술들의 효율적인 대안책을 제공

**종류**

- 디스패치 소스(Dispatch Source)

  GCD 기술의 일부

  특정 유형의 시스템 이벤트를 비동기적으로 처리하기 위한 C 기반 매커니즘

  특정 유형의 시스템 이벤트에 대해 정보를 캡슐화하고, 해당 이벤트가 발생 할 때마다 특정 블록객체ㅡBlock Object: C-Level의 구문이자 런타임 기능, 다수의 스레드에서 사용되고 선택적으로 저장되며 인자로서 넘겨질 수도 있다.ㅡ혹은 기능을 디스패치 대기열에 전달

- 연산 대기열(Operaton Queue)

  Concurrent Dispatch Queue와 동일하게 동작

  작업의 실행 순서를 결정할 때에 다른 요인들을 고려한다.

****

**GCD와 Operation Queue의 차이점**

Operation Queue에서는

- 동시에 실행할 수 있는 연산의 최대 수를 지정할 수 있다.
- KVO(Key Value Observing)ㅡ특정 키값 변화 감지ㅡ을 사용할 수 있는 많은 프로퍼티들이 있다.
- 연산을 일시정지, 재시작, 취소할 수 있다.

**사용**

- Operation Queue : 비동기적으로 실행되어야 하는 작업을 객체지향적 방법으로 사용하는데 적합, KVO를 사용해 작업 진행 상황을 감시하는 방법에 적합
- GCD : 작업이 복잡하지 않고 간단하게 처리하거나 특정 유형의 시스템 이벤트를 비동기적으로 처리할 때 적합

<br>

**!!**

UI업데이트는 반드시 Main Dispatch Queue에서 해야한다. 코코아터치앱에서 UIApplication의 인스턴스가 main thread에 붙기 때문인데 UIApplication은 앱의 run loop를 포함해서 main event loop를 설정하고 처리를 하는데 앱의 main event loop는 터치,제스처 등의 모든 UI 이벤트를 수신한다. 따라서 모든 이벤트는 main thread의 일부가 되며 main thread에서 처리해야한다. 

그런데 만약 main큐에서 동기로 작업을 하게되면 하나의 작업이 끝날 때까지 기다리게되므로 다른 작업을 시작할 수 없다. 이렇게 데드락 상태가 되어 앱이 죽게된다.

<br>

<출처 :

 https://www.edwith.org/boostcourse-ios/lecture/16917/

 https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/ConcurrencyandApplicationDesign/ConcurrencyandApplicationDesign.html#//apple_ref/doc/uid/TP40008091-CH100-SW1

https://zeddios.tistory.com/516

>






