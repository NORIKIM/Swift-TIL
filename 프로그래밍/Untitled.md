

## concurrent 동시성 vs parallel 병렬성

Concurrency : 

동시성(concurrent) : 한cpu가 여러 작업 처리, 논리적 구조

병렬(parallel) : 여러 cpu가 각자의 작업 처리, 물리적 구조

두가지 병합 : 하나 또는 여러 cpu가 작업을 처리



프로세스 vs 스레드

프로세스 : 실행 중인 프로그램, 작업의 흐름을 파악해서 저장해놓은 결과물,

메모리에 로드된 상태

스레드 : 프로세스의 안의 작업 단위 , 여러가지 작업을 동시에 처리

(특정 스레드에서 동작하고 싶을 때 사용 -> Perform Selector)

(Task와 스레드의 차이?: 환경이나 os에 따라 조금씩 다르다, 경우에 따라 프로세스를 지칭하기도 하고 스레드를 지칭하기도 하다.)

Concurrent Programming : 

앱의 화면이 끊김없이 작업이 이루어 지기 위해선 메인 흐름에서 데이터를 불러와야 한다면 메인 스레드에서 분리하여 데이터를 불러오는 작업을 완료하고 메인 흐름이로 돌려준다 => 작업이 갈라진다는 것은 새로운 스레드가 생긴다는 것



GCD(Grand Central Dispatch) 와 operation queue 차이점(실습예정이니 예습필요)

Dispatch queue와 operation queue 비교

ARC를 효율적으로 사용하는 방법 -> autorelease 사용



메인 스레드에 작업을 보낼때는 async를 사용하게 된다.

sync를 사용하게 되면 화면이 멈춰있게 된다.

https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008091-CH1-SW1



큐 주의점?

일반적인 목적의 데이터 구조가 아님

흐름제어를 위한 것

큐에 블록을 한번 추가하면 반드시 실행됨

동기화 api  사용시 주의





