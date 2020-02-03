# UIViewController

<img width="500" src="https://t1.daumcdn.net/cfile/tistory/2613D13C58C64DE32C">

- viewDidLoad()  

  뷰의 컨트롤러가 메모리에 로드되고 난 후에 호출됩니다. 이 viewDidLoad 메소드는 뷰의 로딩이 완료 되었을 때 **시스템에 의해 자동으로 호출**되기 때문에 일반적으로 리소스를 초기화하거나 초기 화면을 구성하는 용도로 주로 사용합니다.

  화면이 처음 만들어질 때 한 번만 실행되므로, 처음 한 번만 실행해야 하는 초기화 코드가 있을 경우 이 메소드 내부에 작성하면 됩니다. 

   ++ loadView가 뷰를 만들고, 메모리에 올린 후에 viewDidLoad가 호출된다

- viewWillAppear()  

  뷰가 이제 나타날 거라는 신호를 컨트롤러에게 알리는 역할을 합니다. 즉 뷰가 나타나기 직전에 호출된다고 볼 수 있다. 다른 뷰에서 갔다가 다시 돌아오는 상황에 해주고 싶은 처리가 있을 때는 viewWillAppear에서 해주면 된다.

  참고 : https://zeddios.tistory.com/44

- viewDidAppear()  

  뷰가 나타났다는 것을 컨트롤러에게 알리는 역할을 합니다. 데이터 가져오기 또는 애니메이션 표시와 같이 뷰가 화면에 나타난 직후에 실행됩니다.

- viewWillDisappear()  

  뷰가 사라지기 직전에 호출되는 함수이다. 변경을 수행하거나 첫 번째 응답자 상태를 종료하는 등의 정리 작업을 수행한다. 

- viewDidDisappear()  

  뷰가 사라진 직후에 호출된다.


**참고 : https://zeddios.tistory.com/43**

<br>

- loadView()

  nib을 생성하지 않고, 프로그래밍으로 뷰계층을 만들 때 사용

  viewController.view를 생성한다. 아직 self.view가 만들어지지 않았기 때문에 self.view를 read할 수 없다.

  따라서, 뷰를 만들고 나면 해당 뷰를 *self.view = 만든view* 해줘야 한다

  (loadView 실행을 완료 후 뷰가 생성되면 viewDidLoad 실행된다.)